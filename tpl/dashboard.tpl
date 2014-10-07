{include file='header.tpl'}
<div id="page-content-wrapper">
    <div class="content-header text-center">
        <h1>
            <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
            <br />
            ({$API->account['company']})<br>Dashboard
        </h1>
    </div>
    <!-- Keep all page content within the page-content inset div! -->
    <div class="page-content inset">
        <div class="row well">
            <div class="col-md-3 text-center">
                <p><span class="text-success"><strong>Registered:</strong></span><br/>
                    CERTs: <strong>{$stats['certs']['ok']}</strong><br/>
                    REGs: <strong>{$stats['regs']['ok']}</strong>
                </p>
            </div>

            <div class="col-md-3 text-center">
                <p><span class="text-warning"><strong>Pending:</strong></span><br/>
                    CERTs: <strong>{$stats['certs']['pending']}</strong><br/>
                    REGs: <strong>{$stats['regs']['pending']}</strong>
                </p>
            </div>

            <div class="col-md-3 text-center">
                <p><span class="text-danger"><strong>Failed:</strong></span><br/>
                    CERTs: <strong>{$stats['certs']['failed']}</strong><br/>
                    REGs: <strong>{$stats['regs']['failed']}</strong>
                </p>
            </div>

            <div class="col-md-3 text-center">
                <p><span class=""><strong>Free:</span> (<a href="#">Top up</a>)</strong><br/>
                    CERTs: <strong>{$stats['certs']['free']}</strong><br/>
                    REGs: <strong>{$stats['regs']['free']}</strong>
                </p>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12 text-center">
                <h2>Check status:</h2>
                <form method="get">
                    UDID or email:<br>
                    <input type="text" name="udid" class="input-sm" value="{$udid}"/><br>
                    Transaction ID:<br>
                    <input type="text" name="transaction_id" class="input-sm" value="{$txid}"/><br>
                    <br>
                    <input type="submit" class="btn btn-primary" value="Search"/>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="text-center">
                    <br />
                    {if $udids}
                        {if $search}<h3>Filtered from search bar</h3>{/if}
                    </div>
                    <div class="table-responsive">
                        <a href="{$API->SEO->make_link('dash','udid',$udid,'transaction_id',$txid,'limit',10)}">Show 10</a> | <a href="{$API->SEO->make_link('dash','udid',$udid,'transaction_id',$txid,'limit',50)}">Show 50</a> | <a href="{$API->SEO->make_link('dash','udid',$udid,'transaction_id',$txid,'limit',100)}">Show 100</a><br/>
                        {if $start}<a href="{$API->SEO->make_link('dash','start',($start-$limit),'udid',$udid,'transaction_id',$txid,'limit',$limit)}">Show previous {$limit}</a> | {/if}<a href="{$API->SEO->make_link('dash','start',($start+$limit),'udid',$udid,'transaction_id',$txid,'limit',$limit)}">Show next {$limit}</a>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <th>UDID</th><th>Type</th><th>Email</th><th>Status</th><th>Added at</th><th>Registered at</th><th>Transaction ID</th><th>Delete key (unique ID)</th><th>Actions</th>
                            </thead>
                            <tbody>
                                {foreach from=$udids item=u}
                                    <tr>
                                        <td>{$u['udid']}</td>
                                        <td>{$u['type']}</td>
                                        <td>{$u['email']}</td>
                                        <td>{if $u['status']=='ok'}
                                            <span class="text-success">Registered</span>
                                            {elseif $u['status']=='registering'}
                                                Registering at the moment
                                                {elseif $u['status']=='pending'}
                                                    <span class="text-warning">Pending</span> (queque no {$u['queue_no']})
                                                    {elseif $u['status']=='failed'}   
                                                        <span class="text-danger">Failed</span>  
                                                        {/if}
                                                        </td>
                                                        <td>{$u['added']|date_format:"%d.%m.%Y %H:%M"}</td>
                                                        <td>{if $u['registered_at']}{$u['registered_at']|date_format:"%d.%m.%Y %H:%M"}{else}No data{/if}</td>
                                                        <td>{$u['transaction_id']}</td>
                                                        <td>{$u['delete_key']}</td>
                                                        <td>{if $u['type']=='CERT'}
                                                            <a href="{$RMU->get_rmu_link($u['cert']['location'])}">Download certificate {$u['cert']['name']}</a> | 
                                                            <a href="{$RMU->get_rmu_link($u['provision']['location'])}">Download provision {$u['cert']['provision']}</a> |
                                                            {/if}
                                                                {if $u['status'] == 'failed'}
                                                                    <a href="{$API->SEO->make_link('dash','action','delete','delete_key',$u['delete_key'])}" onclick="return confirm('Are you sure?');"/>Delete</a>
                                                                {/if}   
                                                        </tr>
                                                        {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>


                                                {else}
                                                    <h1>No UDIDs registered with your account</h1>
                                                    {/if}

                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        {include file="footer.tpl"}