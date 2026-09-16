/* Write your T-SQL query statement below */

/*
-- this solution not good because when missing some dates it doesn't work: 
select 
    id 
from(
    select
        id,
        -- lag is null for the first record so the first diff is null and then ignored in outer query
        temperature - (lag(temperature) over (order by recordDate)) as difference_to_yesterday
    from 
        Weather
)t
where 
    difference_to_yesterday > 0
*/

-- this solution is more robust
select 
    w2.id
from 
    Weather w1
join 
    Weather w2 on w1.recordDate = DATEADD(day, -1, w2.recordDate) 
where 
    w2.temperature > w1.temperature

