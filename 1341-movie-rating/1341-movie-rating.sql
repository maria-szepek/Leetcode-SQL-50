-- /* Write your T-SQL query statement below */

select 
    results
from 
    (
        select top 1
            u.name as results
        from 
            MovieRating mr
        join
            Users u on mr.user_id = u.user_id
        group by 
            u.name
        order by 
            count(mr.movie_id) desc,
            u.name asc
    )first

union all 

select 
    results 
from (
        select top 1
            m.title results
            -- avg(cast(rating as numeric)) as average_rating
        from
            MovieRating mr
        join 
            Movies m on mr. movie_id = m.movie_id
        where 
            year(created_at) = 2020 
            and month(created_at) = 2 
        group by
            m.title
        order by
            avg(cast(mr.rating as numeric)) desc,
            m.title asc
)second



