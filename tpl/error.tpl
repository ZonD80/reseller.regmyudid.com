{include file='header.tpl'}
<!-- Page content -->
<div id="page-content-wrapper">
    <div class="content-header text-center">
        <h1>
            <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            Error occured!
        </h1>
    </div>
    <!-- Keep all page content within the page-content inset div! -->
    <div class="page-content inset">
        <div class="col-md-12">
            <p class="lead text-center">
                {$error}
            </p>
            <p><a href="javascript:history.go(-1);">{$API->LANG->_('Go back')}</a></p>
        </div>


    </div>
</div>
{include file='footer.tpl'}