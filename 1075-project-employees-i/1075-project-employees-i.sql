/* Write your T-SQL query statement below */
select 
    p.project_id,
    round(cast(sum(e.experience_years) as numeric) / count(e.employee_id), 2) as average_years
from 
    Project p
left join
    Employee e on p.employee_id = e.employee_id
group by
    p.project_id
