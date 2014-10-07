<?php

require_once 'init.php';

$API->auth();


require_once 'classes/rmuapi.class.php';

$RMU = new RMU($API->account['api_client_id'], $API->account['api_password']);
if ($RMU->_fail) {
    $API->error('Unable to connect to RMU API');
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $udid = $API->getval('udid');
    $type = $API->getval('type');
    $email = $API->getval('email');
    $transaction_id = $API->getval('transaction_id');
    if ($API->getval('random_txid')) {
        $transaction_id = uniqid();
    }

    if (!$RMU->validate_udid($udid)) {
        $API->error('Invalid UDID supplied. Check it is 40 symbols and in lowercase.');
    }
    if (!in_array($type, array('REG', 'CERT'))) {
        $API->error('Invalid registration type');
    }
    if (!$API->validemail($email)) {
        $API->error('Invalid email address format');
    }
    if (!$transaction_id) {
        $API->error('Missing transaction ID');
    }

    $response = $RMU->register_udid($email, $udid, $type, $transaction_id);

    if ($response['error']) {
        $API->error('Failed to register, API returned error: ' . $response['error']);
    } else {
        $API->safe_redirect($API->SEO->make_link('dash'), 2);
        $API->message('UDID scheduled to be registered', 'Redirecting you to dashboard');
    }
}
$API->TPL->display('register.tpl');
