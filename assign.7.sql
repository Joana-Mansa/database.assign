/*the table created in the previous question, should have country as a column. the country should also be grouped 
based on the transaction id.*/
SELECT City, Volume, Country
INTO atx_volume_city_summary_with_Country
FROM ( Select agents.city AS City, agents.country AS Country, count(agent_transactions.atx_id) AS Volume
    FROM agents INNER JOIN agent_transactions ON agents.agent_id = agent_transactions.agent_id
    where (agent_transactions.when_created > (NOW() - INTERVAL '1 week'))
    GROUP BY agents.country,agents.city) as atx_volume_summary_with_Country;