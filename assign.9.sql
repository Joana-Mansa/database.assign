/*the query primarily groups unique users, two new columns are added to the previous table; count andnumber of 
unique senders.*/
 SELECT COUNT(DISTINCT transfers.source_wallet_id) AS unique_Senders, COUNT(transfer_id) 
 AS transaction_count, transfers.kind AS transfer_kind, wallets.ledger_location 
 AS country, SUM(transfers.send_amount_scalar) AS volume
FROM transfers INNER JOIN wallets ON transfers.source_wallet_id = wallets.wallet_id
WHERE (transfers.when_created BETWEEN (NOW() - INTERVAL'1 week') AND NOW()) GROUP BY country, transfer_kind;
