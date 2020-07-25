/*agent_transactions for the year 2018, broken down into a monthly inventory. the query sums the 
number of trasactions made monthly throughtout 2018. agent_transaction is abbreviated as atx*/
SELECT COUNT(atx_id) AS "agent_transactions in 2018"
FROM agent_transactions AS atx
WHERE EXTRACT(YEAR
              FROM when_created)=2018
GROUP BY EXTRACT(MONTH
                 FROM when_created);
