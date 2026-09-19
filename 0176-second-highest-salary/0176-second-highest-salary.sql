/* Write your T-SQL query statement below */
select 
-- this is just there to return null if needed
    max(salary) SecondHighestSalary
from (
    select distinct
        dense_rank() over (order by salary desc) rk,
        salary
    from 
        Employee
)t
where 
    rk = 2 

