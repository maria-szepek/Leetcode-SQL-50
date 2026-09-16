/* Write your T-SQL query statement below */

select 
    s.student_id,
    s.student_name,
    sb.subject_name,
    sum(
        case
        when e.student_id is not null then 1
        else 0
    end
    ) as attended_exams
from 
    Students s
cross join 
    Subjects sb
full outer join 
    Examinations e on s.student_id = e.student_id and sb.subject_name = e.subject_name 
group by 
    s.student_id,
    s.student_name,
    sb.subject_name
order by 
    s.student_id,
    sb.subject_name

/*
select 
    e.student_id,
    s.student_name,
    e.subject_name,
    count(*) as attended_exams
from 
    Students s
left join
    Examinations e on s.student_id = e.student_id
right join 
    Subjects sb on e.subject_name 
join 
    Students s on e.student_id = s.student_id 
join Subjects sb on e.
group by
    e.student_id,
    s.student_name,
    e.subject_name
    */