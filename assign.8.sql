/*a table is supposed to be created called send_volume_country_and_kind_summary. the total volume of transfers for the past weeks are 
also counted and grouped by the country and  transfer kinds. the table  has these columns; country, transfer kind and volume*/
SELECT transfers.kind AS transfer_kind, wallets.ledger_location AS Country, sum(transfers.send_amount_scalar) AS Volume
INTO send_volume_country_and_kind_summary
FROM transfers INNER JOIN wallets ON transfers.source_wallet_id = wallets.wallet_id
where (transfers.when_created BETWEEN (NOW() - INTERVAL('1 week') AND NOW()) 
GROUP BY wallets.ledger_location, transfers.kind;
