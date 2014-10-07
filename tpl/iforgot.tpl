{include file='header.tpl'}
<!-- Page content -->
<form method="POST">

    <input type="hidden" name="returnto" value="{$returnto}"/>
    <div id="page-content-wrapper">
        <div class="content-header text-center">
            <h1>
                <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
                <br />
                Change/recover password
            </h1>
        </div>
        <!-- Keep all page content within the page-content inset div! -->
        <div class="page-content inset">
            <div class="col-md-12">
                <p class="lead text-center">
                <center>{$API->LANG->_('E-mail')}:<input type="email" name="email" required="required"/><br/>
                    {$API->LANG->_('Password reset request will be sent to this email address')}<br/>
                    {$captcha}</center>

                <center>
                    {if $error}<p style="color: red;">
                            {$error}.
                        </p><br>{/if}
                        <input type="submit" value="{$API->LANG->_('Reset/change password')}"/></center>
                </div>
            </div>
        </div>
    </form>
    {include file='footer.tpl'}