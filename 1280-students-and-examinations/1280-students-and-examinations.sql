/* Write your T-SQL query statement below */

select 
    s.student_id,
    s.student_name,
    sb.subject_name,
    -- sum(
    --     case
    --     when e.student_id is not null then 1
    --     else 0
    -- end
    -- ) as attended_exams
    count(e.subject_name) as attended_exams  -- count() counts only non-null occurences 
from 
    Students s
cross join 
    Subjects sb
left join 
    Examinations e on s.student_id = e.student_id and sb.subject_name = e.subject_name 
group by 
    s.student_id,
    s.student_name,
    sb.subject_name
order by 
    s.student_id,
    sb.subject_name
