/* Write your T-SQL query statement below */
  
select
    d.name Department,
    e.name Employee,
    e.salary Salary 
from 
    Employee e 
join (
    select 
        id,
        dense_rank() over (partition by departmentId order by salary desc) top3
    from 
        Employee 
)t on e.id = t.id
join 
    Department d on e.departmentId = d.id 
where t.top3 <= 3
