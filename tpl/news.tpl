{include file='header.tpl'}

<!-- Page content -->
<div id="page-content-wrapper">
    <div class="content-header text-center">
        <h1>
            <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            ({$API->account['company']})<br>News
        </h1>
    </div>
    <!-- Keep all page content within the page-content inset div! -->
    <div class="page-content inset">
        <div class="col-md-12">
            <p class="lead text-center">This page will be updated with any news we would like to share with you like new products for example</p>
            <br>
            <br>
            {foreach from=$news item=n}
                <div class='well'>
                <strong>{$n.title}
                        <br>{$n.added|date_format:"%d.%m.%Y %H:%M"} GMT</strong>
                    <br>
                    {$n.text}
                </div>
            {/foreach}
        </div>
    </div>
</div>
</div>
{include file='footer.tpl'}