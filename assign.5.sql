/*there is a need to group agents according to their being depositors or withdrawers. Depositors have the net withdrawals
being lesser than their net deposites. withdrawals have their net withdrawals being more than their net deposits. 
and so the agents are supposed to be grouped according to them being either depositors or withdrawals.*/
SELECT SUM(CASE WHEN amount > 0 THEN amount else 0 END) 
AS withdrawal,
    SUM(CASE WHEN amount < 0 then amount else 0 END) 
AS deposit,
    CASE WHEN ((SUM(CASE WHEN amount > 0 
THEN amount else 0 END)) > ((SUM(CASE WHEN amount < 0 then amount else 0 END))) * -1) 
THEN 'net withdrawer' 
ELSE 'net depositor' 
END as agent_status,
    COUNT (*)
FROM agent_transactions
WHERE when_created 
BETWEEN (now() - '1 week'::INTERVAL)
    AND now();
