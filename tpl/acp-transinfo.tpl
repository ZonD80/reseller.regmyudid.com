<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>SuperBit - Free BTC With Every Guide!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <script src="../assets/js/jquery.js"></script>
        <script>
            function reschedule_order(id) {
                var confirmation = prompt('URGENT. Order will be scheduled for payout. Please type "PAY THIS ORDER" without quotes to confirm this action.');
                if (confirmation != 'PAY THIS ORDER') {
                    alert('Wrong confirmation string. Aborted.');
                } else {
                    window.location.href = "acp.php?action=reschedule&id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <a href="acp.php">To ACP main page</a> | <a href="acp.php?action=transinfo">ORDER INFO</a> | <a href="javascript:history.go(-1);">Go back</a>
        <pre>
order statuses:
 * placed - placed but not paid
 * paid - paid via payment gateway
 * pending - pending for payment in payment gateway
 * rejected - order failed somehow
 * completed - order completed without bonus payout
 * credited - order completed and bonus sent to user
 * verification - bonus verification is in progress
 * failed - failed on any step
 * held - held for manual processing
        </pre>
        <form method="get">
            <input type="hidden" name="action" value="transinfo"/>
            Enter ORDER HASHES (one per line) to reteive transactions info:
            <textarea name="txids"/>{$txids}</textarea>
        OR email or id of user:<input name="account" value="{$account}"/>
        OR status: <select name="status"><option value="">--</option>
        <option value="placed" {if $status=='placed'} selected="selected"{/if}>placed</option>
        <option value="paid" {if $status=='paid'} selected="selected"{/if}>paid</option>
        <option value="pending" {if $status=='pending'} selected="selected"{/if}>pending</option>
        <option value="rejected" {if $status=='rejected'} selected="selected"{/if}>rejected</option>
        <option value="completed" {if $status=='completed'} selected="selected"{/if}>completed</option>
        <option value="credited" {if $status=='credited'} selected="selected"{/if}>credited</option>
        <option value="verification" {if $status=='verification'} selected="selected"{/if}>verification</option>
        <option value="failed" {if $status=='failed'} selected="selected"{/if}>failed</option>
        <option value="held" {if $status=='held'} selected="selected"{/if}>held</option>
        </select>
        <input type="submit"/>
    </form>
    <hr/>

    <div>

        {if $txs}
            {$pagercode}
            <table border="1" style="font-size:10px;">
                <thead>
                <th>Order hash (reference in payment system)</th><th>USD amount</th><th>National amount</th><th>BTC</th><th>BTC Address</th><th>TXID (click to view blockchain data)</th><th>Verification address</th><th>Verificaton TXID</th><th>Satoshi secret</th><th>UA</th><th>IP</th><th>Billing Info</th><th>Phone</th><th>Times</th><th>GW response</th><th>Anti-fraud response</th><th>Status</th><th>User</th>
                </thead>
                <tbody>
                    {foreach from=$txs item=t}
                        <tr>
                            <td>{$t.order_hash}</a></td>
                            <td>${$t.amount_usd}</td>
                            <td>{$t.amount_local} (USD/{$t.code_local}={$t.exchange_rate_local})</td>
                            <td>{$t.amount_btc} BTC (BTC/USD={$t.btc_usd})</td>
                            <td>{$t.btc_address}</td>
                            <td><a href="https://blockchain.info/tx/{$t.txid}" target="_blank">{$t.txid}</a></td>
                            <td>{$t.btc_verification_address}</td>
                            <td><a href="https://blockchain.info/tx/{$t.verification_txid}" target="_blank">{$t.verification_txid}</a></td>
                            <td>{$t.satoshi_secret}</td>
                            <td>{$t.user_agent}</td>
                            <td>{$t.ip}</td>
                            <td>{$t.name}<br/>{$t.address}</td>
                            <td>{$t.phone}</td>
                            <td>Placed: {date('r',$t.placed)}<br/>Paid: {date('r',$t.paid)}<br/>Delivered: {date('r',$t.sent)}</td>
                            <td>{$t.gw_response|htmlspecialchars}</td>
                            <td>{json_decode($t.fraud_response,true)|print_r}</td>
                            <td>{$t.status}{if $t.status=='held'}
                                <br/>
                                <a href="javascript://" onclick="reschedule_order({$t.id});"><span style="color:red;">Reschedule payout</span></a>
                                {/if}</td>
                                <td>Name: {$t.aname}<br>Email: {$t.aemail}<br/>Registered: {date('r',$t.added)}<br/><a href="acp.php?action=transinfo&account={$t.account_id}" target="_blank">View orders by this user</a></td>
                            </tr>
                            {/foreach}
                            </tbody>
                        </table>
                            {$pagercode}
                        {/if}
                        </div>
                    </body>
                </html>