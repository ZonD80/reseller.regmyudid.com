<?php

require_once('init.php');

$allnews = $API->DB->query_return("SELECT * FROM news ORDER BY added DESC");

$API->TPL->assign('news',$allnews);

$API->TPL->display('news.tpl');
?>