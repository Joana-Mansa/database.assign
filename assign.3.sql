/*this query focuses on the number of users. And so DISTINCT is attached to the u_id to get the database to 
select the individual ids present without regard for the number of transactions a particular user made.*/
SELECT COUNT(DISTINCT u_id)
FROM transfers
WHERE send_amount_currency = 'CFA';