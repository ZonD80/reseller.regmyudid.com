{include file='doctype.tpl'}  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>RegMyUDiD Reseller Admin Control Panel</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="/">RegMyUDiD Resellers</a></li>
                    {if !$API->account}
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <form action="{$API->SEO->make_link('login')}" method="POST">
                                <li>Email</li>
                                <li><input type="email" placeholder="user@domain.com" size="26" name="email" required/></li>
                                <li>Password</li>
                                <li><input type="password" placeholder="password" size="26" name="password" required/></li>
                                <br>
                                <li><center><input type="submit" class="btn btn-primary" value="Login"/></center></li></form>
                            <br>
                            <li><a href="{$API->SEO->make_link('iforgot')}"><center><font color="#FF0000"><strong>iForgot!</strong></font></center></a></li>
                        </ul>
                    </li>
                {else}
                    <li><a href="{$API->SEO->make_link('logout')}">Logout ({$API->account['company']})</a></li>
                    <li><a href="{$API->SEO->make_link('iforgot')}">Change dashboard password</a></li>

                    <li><a href="{$API->SEO->make_link('dash')}">Dashboard</a></li>
                    <li><a href="{$API->SEO->make_link('settings')}">Settings</a></li>
                    <li><a href="{$API->SEO->make_link('register')}">Manual Registration</a></li>

                    <li><a href="{$API->SEO->make_link('topup')}">Top Up Slots</a></li>
                    {/if}
                <li><a href="{$API->SEO->make_link('news')}">News</a></li>
                <li><a href="http://rmureseller.freshdesk.com" target="_blank">Priority Support desk</a></li>

                <li><a href="https://github.com/regmyudid/rmu-api" target="_blank">API Documentation</a></li>
                <li><a href="http://regmyudid.com" target="_blank">RegMyUDiD</a></li>
            </ul>
        </div>