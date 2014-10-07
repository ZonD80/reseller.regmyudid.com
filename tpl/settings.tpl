{include file='header.tpl'}


<!-- Page content -->
<div id="page-content-wrapper">
    <div class="content-header text-center">
        <h1>
            <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            ({$API->account['company']})<br>Settings
        </h1>
    </div>

    <div class="col-md-12">
        <p class="lead text-center">This page displays all settings relevant to your reseller account. Please make sure all settings are correct to avoid issues.
            <br>
            <br>
        </p>
    </div>


    <!-- Keep all page content within the page-content inset div! -->
    <div class="page-content inset">
        <div class="col-lg-3">
            <form class="form-horizontal well text-center" method="POST">
                <input type="hidden" name="mode" value="personal"/>
                <fieldset>

                    <!-- START OF PERSONAL DETAILS -->
                    <legend>Personal Details</legend>
                    
                    <p><a href="{$API->SEO->make_link('iforgot')}"><strong>You can change password here</strong></a></p>
                    <br>

                    <!-- COMPANY NAME -->
                    <div class="control-group">
                        <label class="control-label" for="company">Company*</label>
                        <div class="controls">
                            <input id="company" required name="company" name="company" value="{$API->account['company']}" type="text" placeholder="company name" class="input-sm">

                        </div>
                    </div>
                    

                    <!-- FIRST NAME -->
                    <div class="control-group">
                        <label class="control-label" for="firstname">Name*</label>
                        <div class="controls">
                            <input id="firstname" name="name" required type="text" value="{$API->account['name']}" placeholder="first name" class="input-sm">

                        </div>
                    </div>
                    

                    <!-- phone -->
                    <div class="control-group">
                        <label class="control-label" for="phone">Phone*</label>
                        <div class="controls">
                            <input id="phone" name="phone" required type="text" value="{$API->account['phone']}" placeholder="internationa phone number" class="input-sm">

                        </div>
                    </div>
                    
                    <!-- EMAIL -->
                    <div class="control-group">
                        <label class="control-label" for="phone">Email*</label>
                        <div class="controls">
                            <input id="email" name="email" required type="text" value="{$API->account['email']}" placeholder="email@address.com" class="input-sm">

                        </div>
                    </div>
                    <br>
                    

                    <!-- Button -->
                    <div class="control-group">
                        <label class="control-label" for="savepersonal"></label>
                        <div class="controls">
                            <input type="submit" id="savepersonal" class="btn btn-primary" value="Save Changes">
                        </div>
                    </div>

                </fieldset>
            </form>
            
            </div>
            
            <div class="col-lg-3">
            <div class="well text-center">
            <form class="form-inline" method="POST">
                <input type="hidden" value="api" name="mode"/>
                <fieldset>
                    <!-- START OF WEBSITE DETAILS -->
                    <legend>API credentials</legend>

                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">From Email Name*</label>
                        <br>
                        <input id="supportemail" name="api[from_name]" required type="text" placeholder="(your company)" value="{$api_info.from_name}" class="input-sm">

                    </div>
                    <br />
                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">From Email*</label>
                        <br>
                        <input id="supportemail" name="api[from_email]" required type="text" placeholder="registration@mysite.com" value="{$api_info.from_email}" class="input-sm">

                    </div>
                    
                    <br />

                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">Support Email Name*</label>
                        <br>
                        <input id="supportemail" name="api[support_name]" required type="text" placeholder="(your company) support"  value="{$api_info.support_name}" class="input-sm">

                    </div>
                    <br />
                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">Support Email*</label>
                        <br>
                        <input id="supportemail" name="api[support_email]" required type="text" placeholder="support@mysite.com" value="{$api_info.support_email}" class="input-sm">

                    </div>
                    
                    <br />

                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">BCC Email</label>
                        <br>
                        <input id="supportemail" name="api[bcc_email]" type="text" placeholder="support@mysite.com"  value="{$api_info.bcc_email}" class="input-sm">

                    </div>
                    <br />

                    <!-- SUPPORT EMAIL -->
                    <div class="form-group">
                        <label class="control-label" for="supportemail">Provision file name*</label>
                        <br>
                        <input id="supportemail" name="api[provision_filename]" required type="text" placeholder="(your company).mobileprovision" value="{$api_info.provision_filename}" class="input-sm">

                    </div>
                    <br>
                    <br>
                    
                    </div>
                    </div>
                    
                    <div class="col-lg-3">
                    <div class="well text-center">
                        <p class="text-danger">
                            <strong>NOTICE!! <br>
                            PLACE FILES CONTAINING HTML OF YOUR EMAILS ON YOUR SERVER. RMU WILL ON EVERY REGISTRATION DOWNLOAD THESE FILES FROM YOUR SERVER AND DELIVER THE HTML TO YOUR CUSTOMER.</srtrong>
                        </p>
                        <br>
                        <br>
                    
                    <!-- SUCCESS EMAIL URL -->
                    <div class="form-group">
                        <label class="control-label" for="successemail">Success Email URL for REGs*</label>
                        <br>
                        <input id="successemail" name="api[reg_mail_file]" required type="text" placeholder="http://mysite.com/success.html" value="{$api_info.reg_mail_file}" class="input-sm">

                    </div>

                    <div class="form-group">
                        <label class="control-label" for="successcertemail">Success Email URL for CERTs*</label>
                        <br>
                        <input id="successcertemail" name="api[cert_mail_file]" required type="text" placeholder="http://mysite.com/success.html" value="{$api_info.cert_mail_file}" class="input-sm">
                       </div>

					<!-- FAIL EMAIL URL -->
                    <div class="form-group">
                        <label class="control-label" for="failemail">Failed Email URL*</label>
                        <br>
                        <input id="failemail" name="api[failed_mail_file]" required type="text" placeholder="http://mysite.com/failed.html" value="{$api_info.failed_mail_file}" class="input-sm">

                    </div>
                    
                    <br>
                        <br>
					
					</div>
					</div>

                    <div class="col-lg-3">
                    <div class="well text-center">
                    <p class="text-danger">
                        WARNING!!! 
                        <br>DO NOT FORGET TO CHANGE PASSWORD IN YOUR API TO, OTHERWISE ALL REQUESTS WILL BE DENIED. PLEASE USE SECURE PASSWORDS WITH AT LEAST 8 SYMBOLS IN DIFFERENT CASES AND SPECIAL SYMBOLS.
                    </p>
                    <br>
                    <br>
                    <p>Current API client ID is: <strong>{if $API->account['api_client_id']}{$API->account['api_client_id']}{else}Not assigned{/if}</strong></p>
                    <p>Current API password is: 
                    <br />
                    <input type="text" class="input-sm" value="{$api_info.api_password}" onclick="this.select();"/></p>
                    <!-- API PASSWORD CHANGE -->
                    <div class="form-group">
                        <label class="control-label" for="passwordapi1">API Password</label>
                        <br>
                        <input id="passwordapi1" name="api[api_password]" type="text" placeholder="type new password here" class="input-sm">


                    </div>

                    <!-- API PASSWORD CHANGE VERIFY -->
                    <div class="form-group">
                        <label class="control-label" for="passwordapi2">Verify API Password</label>
                        <br>
                        <input id="passwordapi2" name="api_password2" type="password" placeholder="verify new password" class="input-sm">

                    </div>

                    <!-- SAVE BUTTON -->
                    <div class="control-group">
                        <label class="control-label" for="savepassword"></label>
                        <div class="controls">
                            <input type="submit" class="btn btn-primary" value="Save Changes"/>
                        </div>
                    </div>

                </fieldset>
            </form>
            </div>
            </div>

        </div>
	</div>
</div>
</div>
{include file='footer.tpl'}