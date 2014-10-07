<?php

require_once 'init.php';

$returnto = $API->getval('returnto');

if ($_SERVER['REQUEST_METHOD']=='POST') {
    $email = $API->getval('email');
    $password = $API->getval('password');

    if (!$API->login_account($email,$password)) {
    $API->safe_redirect($API->SEO->make_link('login','error','invalid'));
    }
    else {

    $API->TPL->assign('message', $API->LANG->_('You successfully logged in. We are redirecting you in 2 seconds'));
    if (!$returnto) $returnto = $API->SEO->make_link('dash');
    $API->safe_redirect($returnto,2);
    $API->TPL->display('message.tpl');
    die();
    }
}

$API->TPL->assign('error',$API->getval('error'));
$API->TPL->assign('returnto',$returnto);
$API->TPL->display('login.tpl');


?>