/* Write your T-SQL query statement below */
-- this is increasing total or wahtever thats called 
select top 1
    person_name
from (
    select 
        *,
        sum(weight) over (order by turn) increasing_total
    from 
        Queue
)t
where 
    increasing_total <= 1000
order by increasing_total desc

