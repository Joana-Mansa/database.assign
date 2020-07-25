/* this query looks out for wallets that made transactions more than 10000000 CFA and by the exact amount with which they exceeded
the 10000000 CFA between the stipulated time..*/
SELECT source_wallet_id, send_amount_scalar AS "Amounts transfered"
FROM transfers
WHERE send_amount_currency = 'CFA' AND (send_amount_scalar>10000000) 
AND (transfers.when_created BETWEEN (NOW() - INTERVAL'1 month') AND NOW());