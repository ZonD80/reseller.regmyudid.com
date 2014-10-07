{include file='header.tpl'}
<!-- Page content -->
<form method="POST">
    
    <input type="hidden" name="returnto" value="{$returnto}"/>
<div id="page-content-wrapper">
    <div class="content-header text-center">
        <h1>
            <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            Please log in
        </h1>
    </div>
    <!-- Keep all page content within the page-content inset div! -->
    <div class="page-content inset">
        <div class="col-md-12">
            <p class="lead text-center">
                <center>Email: 
                <br><input type="email" name="email" class="input-sm" required="required"/>
                <br>
                <br/>Password: 
                <br><input type="password" name="password" class="input-sm" required="required"/></center>
            </p>
            <br>
            
        <center>
              {if $error=='invalid'}<p style="color: red;">
            {$API->LANG->_('<strong>Email or password is invalid</strong>')}.
           </p><br>
           {elseif $error=='auth'}<p style="color: red;">
            {$API->LANG->_('<strong>You must be logged in to continue</strong>')}.
           </p><br>
           {elseif $error=='access'}<p style="color: red;">
            {$API->LANG->_('<strong>You must have required permissions to access this page</strong>')}.
           </p><br>{/if}
            <input type="submit" class="btn btn-primary" value="{$API->LANG->_('Login')}"/>
            <br>
            <br><a href="{$API->SEO->make_link('iforgot')}">{$API->LANG->_('Reset password')}</a></center>
            
        </div>


    </div>
</div>
</form>
{include file='footer.tpl'}