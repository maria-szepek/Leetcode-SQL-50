/* Write your T-SQL query statement below */
select 
    id, 
    case
        when id%2 = 1 then coalesce(lead, student) 
        when id%2 = 0 then lag
    end student
from (
select 
    *,
    lead(student) over (order by id) lead,
    lag(student) over (order by id) lag
    from Seat s1  
)t

