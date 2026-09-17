/* Write your T-SQL query statement below */
SELECT
    user_id,
    ROUND(
        CAST(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS NUMERIC) / COUNT(*),
        2
    ) AS confirmation_rate
FROM 
    Confirmations
GROUP BY 
    user_id

UNION ALL

SELECT 
    s.user_id,
    0
FROM 
    Signups s
LEFT JOIN 
    Confirmations c ON s.user_id = c.user_id 
WHERE 
    c.user_id IS NULL  
