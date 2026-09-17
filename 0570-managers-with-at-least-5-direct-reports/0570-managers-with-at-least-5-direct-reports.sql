/* Write your T-SQL query statement below */
SELECT 
    name
FROM (
    SELECT 
        m.id,
        m.name
    FROM 
        Employee e
    JOIN 
        Employee AS m ON e.managerId = m.id
    GROUP BY 
        m.id,
        m.name
    HAVING 
        count(e.id) >= 5
)t
