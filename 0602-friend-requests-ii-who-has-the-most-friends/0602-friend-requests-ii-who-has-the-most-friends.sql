/* Write your T-SQL query statement below */
select top 1 
    id,
    count(*) num
from (
    select 
        requester_id id
    from
        RequestAccepted f
    union all 
    select 
        accepter_id id 
    from
        RequestAccepted f    
)t
group by 
    id
order by count(*) desc


