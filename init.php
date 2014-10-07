<?php

/**
 * Script that initializes all stuff
 *
 */
define('INIT', true);
define('DS', DIRECTORY_SEPARATOR);
define('TIME', time());
ini_set('session.cache_limiter', ''); // prevent no-cache


require_once 'classes' . DS . 'api.class.php';

$db = array(
    'host' => 'localhost',
    'user' => 'reseller',
    'pass' => 'Y5ec9E5Zf4xbVzXZ',
    'db' => 'reseller',
    'charset' => 'utf8'
);

$CONFIG = array(
    'debug_language' => 1,
    'static_language' => 0,
    'languages'=>'en',
    'defaultbaseurl' => 'https://reseller.regmyudid.com',
    'sitename' => 'RegMyUDID Reseller',
    'siteemail' => 'noreply@reseller.regmyudid.com',
    'adminemail' => 'admin@reseller.regmyudid.com',
    'ROOT_PATH' => dirname(__FILE__) . DS,
    'TIME' => time(),
    'START' => microtime(true),
    'CACHEDRIVER' => 'native',
    'cache_dir' => dirname(__FILE__) . DS . 'cache',
    'TEMPLATE_PATH' => dirname(__FILE__) . DS . 'tpl',
);
$API = new API($CONFIG, $db);

$API->TPL->template_dir = $CONFIG['TEMPLATE_PATH'];

if ($_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest')
    define("AJAX", true);
else
    define("AJAX", false);

$API->session();

$API->LANG = new LANG($API);

if ($API->account&&!$API->account['active']) {
    $API->error('Your account is not active yet.');
}

?>