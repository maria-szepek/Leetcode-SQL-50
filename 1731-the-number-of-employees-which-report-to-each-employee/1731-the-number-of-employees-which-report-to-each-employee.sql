/* Write your T-SQL query statement below */
select 
    m.employee_id,
    m.name,
    count(e.employee_id) as reports_count,
    round(avg(1.0 * e.age), 0) as average_age
from
    Employees e
left join
    Employees m on e.reports_to = m.employee_id
where 
    m.employee_id is not null
group by
    m.employee_id,
    m.name
order by 
    m.employee_id


