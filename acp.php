<?php

require_once 'init.php';

$API->auth();

if ($API->account['type'] != 'admin') {
    die('Access denied.');
}

$API->httpauth();



$action = $API->getval('action');
$id = $API->getval('id', 'int');

if (!$action) {
    $API->TPL->display('acp.tpl');
} elseif ($action == 'rmu') {

    print '<h1>ACP RMU API VIEW; <a href="acp.php">Go back to ACP main page</a></h1>';
    require_once 'classes/rmuapi.class.php';
    $clients = $API->DB->query_return("SELECT * FROM accounts WHERE api_client_id<>'' ORDER BY api_client_id ASC");
    foreach ($clients as $c) {
        unset($RMU);
        print "Client API ID <strong>{$c['api_client_id']}</strong>; {$c['name']}; {$c['company']}:<br/>";
        $RMU = new RMU($c['api_client_id'], $c['api_password']);
        print "<pre>";
        if ($RMU->_fail) {
            print "Unable to connect to RMU API";
        } else {
            print_r($RMU->get_statistics());
        }
        print "</pre><hr/>";
    }
} elseif ($action == 'delete-news') {
    $API->DB->query("DELETE FROM news WHERE id=$id");

    $API->CACHE->clearGroupCache('news');
    $API->TPL->assign('message', 'News deleted.');
    $API->safe_redirect($API->SEO->make_link('acp', 'action', 'news'), 1);
    $API->TPL->display('message.tpl');
    die();
} elseif ($action == 'news') {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $to_news['title'] = htmlspecialchars($API->getval('title'));
        $to_news['text'] = $API->cleanhtml($API->getval('text'));
        if (!$id) {
            $to_news['added'] = $CONFIG['TIME'];
            $API->DB->query("INSERT INTO news " . $API->DB->build_insert_query($to_news));
            $newid = $API->DB->mysql_insert_id();
        } else {
            $before = $API->DB->query_row("SELECT title,text FROM news WHERE id=$id");
            if ($before != $to_news)
                $API->write_log("{$API->account['name']} editen news with title {$to_news['title']}", 'admincp_news', $id);
            $API->DB->query("UPDATE news SET " . $API->DB->build_update_query($to_news) . " WHERE id=$id");
        }
        $API->CACHE->clearGroupCache('news');
        $API->TPL->assign('message', 'News successfully edited/added. You wil be redirected in 1 second.');
        $API->safe_redirect($API->SEO->make_link('acp', 'action', 'news'), 1);
        $API->TPL->display('message.tpl');
        die();
    }
    if ($id) {
        $news = $API->DB->query_row("SELECT * FROM news WHERE id=$id");
        $API->TPL->assign('news', $news);
    }
    $newsdata = $API->DB->query_return("SELECT * FROM news ORDER BY added DESC");
    $API->TPL->assign('newsdata', $newsdata);
    $API->TPL->display('acp-news.tpl');

    die();
} elseif ($action == 'lang') {
    $mode = htmlspecialchars($API->getval('mode'));
    $API->TPL->assign('mode', $mode);
    if ($mode == 'export') {
        $lang_export = substr(trim($API->getval('lang_export')), 0, 2);
        $API->TPL->assign('lang_export', $lang_export);
        if ($lang_export) {
            $check = $API->DB->get_row_count('languages', 'WHERE ltranslate=' . $API->DB->sqlesc($lang_export));
            if (!$check)
                $API->error("No language with this code");
            $API->LANG->export_langfile($lang_export);
            die();
        } else {
            $langs = $API->DB->query_return('SELECT ltranslate FROM languages GROUP BY ltranslate');
            $API->TPL->assign('langs', $langs);
        }
    } elseif ($mode == 'import') {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $lang = htmlspecialchars(substr(trim($API->getval('language')), 0, 2));
            $f = $_FILES["langfile"];
            if (!is_uploaded_file($f["tmp_name"]) || !filesize($f["tmp_name"])) {
                $API->error('File upload error or file size 0 bytes');
            }
            $result = $API->LANG->import_langfile($f["tmp_name"], $lang, $_POST['override']);
            if ($result['errors']) {
                $status['errors'] = implode('<br/>', $result['errors']);
            }
            if ($result['words']) {
                $status['ok'] = implode('<br/>', $result['words']);
            }
            $API->TPL->assign('result', $result);
            $API->CACHE->clearCache('languages', $lang);
        }
    } elseif ($mode == 'editor') {

        $langs = $API->DB->query_return("SELECT ltranslate FROM languages GROUP BY ltranslate");
        $API->TPL->assign('langs', $langs);
        $do = $API->getval('do');

        if (!$do) {
            $query = array();
            $searchkey = $API->getval('searchkey');
            $searchvalue = $API->getval('searchvalue');
            if ($searchkey)
                $query[] = "lkey LIKE " . $API->DB->sqlwildcardesc($searchkey);
            if ($searchvalue)
                $query[] = "lvalue LIKE " . $API->DB->sqlwildcardesc($searchvalue);

            $searchkey = htmlspecialchars($searchkey);
            $searchvalue = htmlspecialchars($searchvalue);
            $API->TPL->assign('searchkey', $searchkey);
            $API->TPL->assign('searchvalue', $searchvalue);
            if ($query)
                $query = ' WHERE ' . implode(' AND ', $query);
            else
                $query = NULL;
            $count = $API->DB->get_row_count('languages', $query);

            list($limit, $pagercode) = $API->generate_pagination($count, array('acp', 'action', 'lang', 'mode', 'editor', 'searchkey', $searchkey, 'searchvalue', $searchvalue), 10);
            $API->TPL->assign('pagercode', $pagercode);

            $API->TPL->assign('data', $API->DB->query_return("SELECT * FROM languages$query ORDER BY lkey DESC $limit"));
        } elseif ($do == 'saveadd') {
            $lang = array_map("strval", $API->getval('word', 'array'));
            $key = trim($API->getval('key'));
            if (!$lang || !$key) {
                $API->error('Missing form data');
            }
            foreach ($lang as $l => $word) {
                $word = (trim((string) $word));
                if ($word) {
                    $l = substr($l, 0, 2);
                    $API->DB->query("INSERT INTO languages (lkey,ltranslate,lvalue) VALUES (" . $API->DB->sqlesc($key) . "," . $API->DB->sqlesc($l) . "," . $API->DB->sqlesc($word) . ")");
                    if (mysql_errno() == 1062) {
                        $errors.= 'REDECLARATED KEY:"' . $key . '"<br/>';
                    }
                    $okays.= "$l: $key : $word<br/>";
                }
            }
            $API->CACHE->clearGroupCache('languages');
            $API->TPL->assign('message', "Added: $okays");
            $API->TPL->assign('warning', "Errors: $errors");
            $API->TPL->display('message.tpl');
            die();
        } elseif ($do == 'gensave') {
            $keys = $API->getval('key', 'array');
            $vals = $API->getval('val', 'array');

            foreach ($keys as $key => $chkey) {
                if (is_array($chkey)) {
                    foreach ($chkey as $lang => $keyvalue) {
                        $lang = substr(trim($lang), 0, 2);
                        $API->DB->query("UPDATE languages SET lkey=" . $API->DB->sqlesc($keyvalue) . ", lvalue=" . $API->DB->sqlesc($vals[$key][$lang]) . " WHERE lkey=" . $API->DB->sqlesc($key) . " AND ltranslate = " . $API->DB->sqlesc($lang));
                        if (mysql_errno() == 1062)
                            $fail[] = ($key <> $keyvalue ? "{$key}-&gt;{$keyvalue}" : $key) . " : {$vals[$key][$lang]}";
                        else
                            $success[] = ($key <> $keyvalue ? "{$key}-&gt;{$keyvalue}" : $key) . " : {$vals[$key][$lang]}";
                    }
                }
            }
            if ($fail)
                $errors = implode("<br/>", $fail);
            if ($success)
                $okays = implode("<br/>", $success);
            $API->CACHE->clearGroupCache('languages');
            $API->TPL->assign('message', "Okays: $okays");
            $API->TPL->assign('warning', "Errors: $errors");
            $API->TPL->display('message.tpl');
            die();
        } elseif ($do == 'delete') {
            $lang = $API->DB->sqlesc(substr(trim($API->getval('language')), 0, 2));
            $key = $API->DB->sqlesc((trim($API->getval('key'))));
            $API->DB->query("DELETE FROM languages WHERE lkey=$key AND ltranslate=$lang");
            $API->CACHE->clearCache('languages', $lang);
            die('Successfully deleted');
        }
    } elseif ($mode == 'clearcache') {
        $API->CACHE->clearGroupCache('languages');
        $API->safe_redirect($API->SEO->make_link('acp', 'action', 'lang'), 1);
        $API->TPL->assign('message', "Language cache cleared. Redirecting you back in 1 second");
        $API->TPL->display('message.tpl');
        die();
    }
    $API->TPL->display('acp-language.tpl');
    die();
} elseif ($action == 'accounts') {


    $mode = $API->getval('mode');
    $id = $API->getval('id', 'int');

    if ($mode == 'activate') {
        $name = $API->getval('aname');
        $active = ($API->getval('active') ? 1 : 0);

        $account = $API->DB->query_row("SELECT * FROM accounts WHERE id={$API->DB->sqlesc($name)} OR email={$API->DB->sqlesc($name)}");

        if (!$account)
            $API->error('No account with such id or email');

        $to_accounts['active'] = $active;
        $API->DB->query("UPDATE accounts SET {$API->DB->build_update_query($to_accounts)} WHERE id={$account['id']}");

        $body = @file_get_contents('EMAILS/account_activation.html');
        $API->send_mail($account['email'], 'RegMyUDID Reseller', $API->CONFIG['siteemail'], 'Your reseller account has been activated', $body);
        $API->safe_redirect($API->SEO->make_link('acp', 'action', 'accounts'), 1);
        die('Account activated');
    }
    elseif ($mode == 'deactivate') {
        $API->DB->query("UPDATE accounts SET active=0 WHERE id=$id");
        $API->safe_redirect($API->SEO->make_link('acp', 'action', 'accounts'), 1);
        die('Account disactivated');
    }
    $count = $API->DB->get_row_count('accounts');
    list($limit, $pagercode) = $API->generate_pagination($count, array('acp', 'mode', 'accounts'));
    $API->TPL->assign('pagercode', $pagercode);
    $accounts = $API->DB->query_return("SELECT * FROM accounts ORDER BY added DESC $limit");
    $API->TPL->assign('accounts', $accounts);
    $API->TPL->display('acp-accounts.tpl');
    die();
}
?>