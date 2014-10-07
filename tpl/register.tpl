{include file='header.tpl'}
<div id="page-content-wrapper">
        <div class="content-header text-center">
        <h1>
          <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            ({$API->account['company']})<br>Manual Registration
          </h1>
        </div>
        <!-- Keep all page content within the page-content inset div! -->
        <div class="page-content inset">
          <div class="col-md-12">
          <br />
          <br />
          <br />
              <p class="lead text-center">Use the form below to maunally register UDiDs</p>
            </div>
            <br>
            <br>
            
           <div class="row-fluid text-center">
            <div class="span6">
            <p class="well"><font size="+2"><strong>Please Read Before Submitting!</strong></font>
              <br>
              <br>
              The same rules that apply to regular customers also apply for resellers. The reason for this is that Apple have restricted the changing of UDiDs once submitted.
              <br>
			  <br>
              <br>
              <font color="#FF0000"><strong>**Please take care entering your UDiD - UDiD's that start with FFFFFF or ffffff are invalid. 
              <br>Please refer to this guide <a href="http://regmyudid.com/beta/#Find-UDiD" target="_blank">HERE</a> on how to correctly obtain your UDiD. DO NOT USE AN APP TO GET YOUR UDID!! Wrongly submitted UDiDs are non refundable!</strong></font>
              <br>
              <br>
              <br>
              Once you press the registration button a slot will be deducted from your accounts relevant available slots depending on the registration type you have specified.
              <br>
              <br>
              Also upon pressing the registration button you are also agreeing to the general RegMyUDiD terms and conditions which can be found <a href="http://regmyudid.com/beta/#terms" target="_blank"><strong>HERE</strong></a>
              <br><br>
              </p>
            </div>
            
            <div class="span6">
              <form class="form-horizontal well" method="POST" onsubmit="return confirm('Are you sure to register this UDID?')">
<fieldset>

<!-- START OF MANUAL REGISTRATION FORM -->
<legend>Manual Registration</legend>

<p class="text-danger"><strong>WARNING! System only checks Transaction ID to be unique, please be sure that you are registering unique UDID. 
<br /><a href="{$API->SEO->make_link('dash')}">Search for UDID in dashboard</a></strong></p>
<!-- REGISTRATION TYPE SELECT -->
<div class="control-group">
  <label class="control-label" for="registrationtype">Registration Type</label>
  <div class="controls">
    <select id="registrationtype" name="type" class="input-sm">
      <option value="REG">Standard (UDiD only)</option>
      <option value="CERT">Advanced (iSignCloud)</option>
    </select>
  </div>
</div>
<br>

<!-- UDiD INPUT-->
<div class="control-group">
  <label class="control-label" for="udid">40 Character Device UDiD* <font color="#FF0000">**</font> </label>
  <div class="controls">
    <input id="udid" name="udid" type="text" required placeholder="lowercase with no spaces" class="input-sm" >
    
  </div>
</div>
<br>

<!-- CUSTOMER EMAIL INPUT-->
<div class="control-group">
  <label class="control-label" for="udidemail">Customer Email*</label>
  <div class="controls">
    <input id="udidemail" name="email" type="text" required placeholder="customer@theirdomain.com" class="input-sm">
    
  </div>
</div>
<br>

<!-- CUSTOMER EMAIL INPUT-->
<div class="control-group">
  <label class="control-label" for="udidemail">Transaction ID*</label>
  <div class="controls">
    <input id="udidemail" name="transaction_id" type="text" placeholder="unqiue transaction id" class="input-sm">
    <br /><label style="cursor:pointer;"><input type="checkbox" name="random_txid" value="1"/> Generate random instead</label>
  </div>
</div>
<br>

<!-- REGISTER UDiD BUTTON -->
<div class="control-group">
  <label class="control-label" for="registerudid"></label>
  <div class="controls">
    <input type="submit" id="registerudid" class="btn btn-primary" value="Register UDiD"/>
  </div>
</div>

</fieldset>
</form>
            </div>
           </div>
           </div>
          {include file='footer.tpl'}