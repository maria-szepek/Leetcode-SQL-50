/* Write your T-SQL query statement below */
select 
    contest_id,
    round((1.0 * count(r.user_id) / (select count(user_id) from Users)) * 100, 2) as percentage
from 
    Register r
group by 
    contest_id
order by 
    2 desc,
    1 asc
