{include file='header.tpl'}
<div id="page-content-wrapper">
                <div class="content-header text-center">
                    <h1>
                        <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
                        <br />
                        Resellers<br>Sign Up!
                    </h1>
                </div>
                <!-- Keep all page content within the page-content inset div! -->
                <div class="page-content inset">
                    <div class="col-md-12">
                        <p class="lead text-center">Use this form to apply about becoming an official RegMyUDiD reseller!.</p>
                    </div>
                    
					<div class="row-fluid">
                    <div class="span6">
                        <div class="well text-center">
                            <p><font size="+1">Please use the form priovided to apply to become an official RegMyUDiD reseller. Please also check any of the additional services you may be interested in so we are able to acuralty quote you for the services you require.
                                <br>
                                <br>We aim to respond to your request within 24 hours Monday to Friday. Over the weekend we may take a little longer to get back to you.</font></p>
                        </div>
                    </div>
					
					<div class="span6 well">
                        <div class="contact_form text-center">  
                            <div id="note"></div>
                            <div id="fields">
                                <span class="text-danger">{$error}</span>
                                <form id="signup-form" method="POST">
                                    <div class="form_info col-md-12"><strong>First Name</strong> <span class="required">*</span></div>
                                    <input class="input-sm" type="text" name="firstname" value="" />
                                    <br>
                                    <br>

                                    <div class="form_info col-md-12"><strong>Last Name</strong> <span class="required">*</span></div>
                                    <input class="input-sm" type="text" name="lastname" value="" />
                                    <br>
                                    <br>

                                    <div class="form_info col-md-12"><strong>Company Name</strong> <span class="required">*</span></div>
                                    <input class="input-sm" type="text" name="company" value="" />
                                    <br>
                                    <br>

                                    <div class="form_info col-md-12"><strong>Email</strong> <span class="required">*</span></div>
                                    <input class="input-sm" type="text" name="email" value="" />
                                    <br>
                                    <br>
                                    
                                    <div class="form_info col-md-12"><strong>Contact phone</strong> <span class="required">*</span></div>
                                    <p>Please use full internatinal phone number. We will call you to activate your account!</p>
                                    <input class="input-sm" type="text" name="phone" placeholder="+12345678901" /><br/>
                                    <input class="input-sm" type="text" name="extra[time_to_call]" placeholder="time or interval to call"/><br/>
                                    Please mention your timezone.
                                    <br>
                                    <br>
                                    <div class="form_info col-md-12"><strong>Extra services</strong></div>
                                    
                                    <input type="checkbox" name="extra[hosting]" value="yes"/> Hosting required<br/>
                                    <input type="checkbox" name="extra[website]" value="yes"/> Pre-made website required<br/>
                                    <input type="checkbox" name="extra[domain]" value="yes"/> Premium UDID domain name required<br/>
                                    <br>
                                    <br>
                                    <center>{$captcha}</center>
                                    <!-- Button -->
                                    <div class="control-group">
                                        <label class="control-label" for="signup"></label>
                                        <div class="controls">
                                            <button id="signup" name="signup" class="btn btn-primary">Submit!</button>
                                        </div>
                                    </div>
                                    <div class="text-center text-danger">
                                    <br>
                                    <br>
                                        <p><strong>Your application will be reviewed by our team within 2 working days</strong></p>
                                    </div>

                                </form>
                            </div>
                          </div>
                       </div>
                    </div>
                </div>
            </div>
{include file='footer.tpl'}