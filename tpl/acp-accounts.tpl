{include file='doctype.tpl'}
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="js/jquery-1.10.2.js"></script>
    {*<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css"/>
    <link rel="stylesheet" type="text/css" href="./css/demo_table.css"/>

    <title>AA admicp accounts</title>


    {literal}
        <script>
            $(document).ready(function() {
                $('#accountstable').dataTable();
            });
        </script>

    {/literal}*}
</head>
<body>
    <h1>accounts admicp | <a href="javascript:history.go(-1);">Go back</a> | <a href="{$API->SEO->make_link('acp')}">Main page</a></h1>

    <h2><a href="javascript://" onclick="$('#actadder').slideDown();">activate someone</a></h2>
    <div id="actadder" style="display:none;">
        <form method="post" onsubmit="return confirm('Are you sure?');">
            <input type="hidden" name="mode" value="activate"/>
            Username or email: <input name="aname" required="required"/><br/>
            active?: <select name="active"><option value="1">Yes</option><option value="0">No</option></select><br/>
            <input type="submit" value="Do this!"/>
        </form>
    </div>
    {$pager}
    <table id="accountstable" border="1">
        <thead>
        <th>Name</th><th>Company</th><th>Phone</th><th>Extra</th><th>Email</th><th>Active?</th><th>Actions</th>
    </thead>
    <tbody>

        {foreach from=$accounts item=b}
            <tr id="account-{$b.id}">
                <td>{$b.name}</td>
                <td>{$b.company}</td>
                <td>{$b.phone}</td>
                <td>{$b.extra|nl2br}</td>
                <td>{$b.email}</td>
                <td>{if $b.active}yes{else}no{/if}</td>
            <td>
                <a href="acp.php?action=accounts&mode=deactivate&id={$b.id}">deactivate</a>
            </td>

        </tr>
        {/foreach}
        </tbody>
    </table>
        {$pager}
</body>
</html>