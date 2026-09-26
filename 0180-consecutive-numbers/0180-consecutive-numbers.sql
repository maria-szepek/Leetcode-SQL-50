/* Write your T-SQL query statement below */
select distinct 
    num ConsecutiveNums
from (
    select 
        num,
        lead(num) over (order by id) lead_1,
        lead(num, 2) over (order by id) lead_2 
    from Logs    
)t
where num = lead_1 and lead_1 = lead_2

