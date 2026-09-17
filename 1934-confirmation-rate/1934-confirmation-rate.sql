/* Write your T-SQL query statement below */

select
    c.user_id,
    round(cast(sum(case when action = 'confirmed' then 1 else 0 end) as numeric) / count(*), 2)  as confirmation_rate
from 
    Confirmations c
group by c.user_id

union all

select 
    s.user_id,
    0
from 
    Signups s
left join 
    Confirmations c on s.user_id = c.user_id 
where 
    c.user_id is null  
