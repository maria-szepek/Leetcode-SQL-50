/* Write your T-SQL query statement below */
with tmp as (
    select 
        *,
        count(*) over (partition by employee_id) as cnt_departments
    from 
        Employee
)
select 
    employee_id,
    department_id
from
    tmp 
where primary_flag = 'Y'

union all 

select 
    employee_id,
    department_id 
from
    tmp
where 
    cnt_departments = 1 

