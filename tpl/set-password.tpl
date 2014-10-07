{include file='header.tpl'}
<!-- Page content -->
<form method="POST">

    <input type="hidden" name="returnto" value="{$returnto}"/>
    <div id="page-content-wrapper">
        <div class="content-header text-center">
            <h1>
                <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
                <br />
                Change / Recover Password
            </h1>
        </div>
        <!-- Keep all page content within the page-content inset div! -->
        <div class="page-content inset">
            <div class="col-md-12">
                <p class="lead text-center">
       <center>
           <strong>{$API->LANG->_('Current password')}:<br/><input type="password" name="old_password" required="required"/><br/>
           <br />
           {$API->LANG->_('Desired password')}:<br/><input type="password" name="password" required="required"/><br/>
           <br />
           {$API->LANG->_('Desired password')} ({$API->LANG->_('confirmation')}):<br/><input type="password" name="password2" required="required"/></strong></center><br/>
           <br />
           <div class="text-danger text-center"><strong>{$API->LANG->_('Password activation email will be sent to you')}.</strong></div>
           <br />
           <br />

                <center>
                    {if $error}<p style="color: red;">
                            {$error}.
                        </p><br>{/if}
                        <input type="submit" class="btn btn-primary" value="{$API->LANG->_('Reset/change password')}"/></center>
                </div>
            </div>
        </div>
    </form>
    {include file='footer.tpl'}