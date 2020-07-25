/*the table for tranfers is queried to display the number of sent transactions
in CFA, the transfer_id is the preferred column because of its unique key tag.
the transfer_id would uniquely identify each transaction sent in CFA. if i had used the send_money_column instead
the count would have perhaps overlooked transactions made on the sameday.
*/
SELECT COUNT(transfer_id)
FROM transfers
WHERE send_amount_currency = 'CFA' ;
