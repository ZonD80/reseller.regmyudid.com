<?php

require_once 'init.php';

$API->logout_account();

$API->TPL->assign('message', $API->LANG->_('You successfully logged out'));
//$API->safe_redirect($returnto,2);
$API->TPL->display('message.tpl');
?>