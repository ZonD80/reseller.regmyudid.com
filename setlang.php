<?php

require_once 'init.php';

$l = $API->getval('l');

if ($l) {
    $API->LANG->setlang($l);
    $API->TPL->assign('message', $API->LANG->_('Language was set. We are redirecting you in 2 seconds.'));
    if (!$returnto) $returnto = '/';
    $API->safe_redirect($returnto,2);
    $API->TPL->display('message.tpl');
    die();
}

// here comes view
?>