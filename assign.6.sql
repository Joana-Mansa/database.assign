/*the number of transactions made in a week, grouped by virtue of the cities, the cities characterise where 
the agents made the transactions. so the columns city and volume are picked and placed into a table, atx_volume_city_summary
and transaction ids are counted as volume.based on the common column, agent_id, the tables agents and agent_transactions are merged
the query would fish out transactions between now and a week ago. */
SELECT City,
       Volume INTO atx_volume_city_summary
FROM
    (Select agents.city AS City,
            COUNT(agent_transactions.atx_id) AS Volume
     FROM agents
     INNER JOIN agent_transactions ON agents.agent_id = agent_transactions.agent_id
     WHERE (agent_transactions.when_created BETWEEN (NOW() - INTERVAL '1 week') AND NOW())
     GROUP BY agents.city) AS atx_volume_summary;