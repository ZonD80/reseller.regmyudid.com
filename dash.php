<?php

require_once 'init.php';
$API->auth();

require_once 'classes/rmuapi.class.php';

$RMU = new RMU($API->account['api_client_id'], $API->account['api_password']);

if ($RMU->_fail) {
    $API->error('Unable to connect to RMU API');
}

$statisics = $RMU->get_statistics();

$action = $API->getval('action');

if ($action == 'delete') {
    $delete_key = $API->getval('delete_key');

    $result = $RMU->delete_udid($delete_key);

    if ($result['success']) {
        $API->safe_redirect($API->SEO->make_link('dash'), 2);
        $API->message('UDID deleted', 'Redirecting you back to dashboard');
    } else {
        $API->error('UDID was not deleted. It is not failed or successful registration was not done yet.');
    }
}

$udid = $API->getval('udid');
$txid = $API->getval('transaction_id');
$added = $API->getval('added', 'int');
$start = $API->getval('start','int');
$limit = $API->getval('limit','int');

if (!$limit||$limit<0) {
    $limit=10;
}
$API->TPL->assign('limit',$limit);
$API->TPL->assign('start',$start);

$API->TPL->assign('udid', htmlspecialchars($udid));
$API->TPL->assign('txid', htmlspecialchars($txid));

$udids = $RMU->get_status($udid, $txid, $added,$start,$limit);

//var_dump($udids);
$API->TPL->assign('udids', $udids);
if ($udid || $txid || $added) {
    $API->TPL->assign('search', true);
}

$API->TPL->assignByRef('RMU', $RMU);

$API->TPL->assign('stats', $statisics);
$API->TPL->display('dashboard.tpl');
