-- /* Write your T-SQL query statement below */
select distinct
    query_name,
    round(quality, 2) as quality,
    round((cast(number_poor_queries as numeric) / number_queries) * 100, 2) as poor_query_percentage
from (
    select 
        query_name,  
        avg(cast(rating as numeric)/position) over (partition by query_name) as quality,
        sum(case when rating < 3 then 1 else 0 end) over (partition by query_name) as number_poor_queries,
        count(*) over (partition by query_name) as number_queries
    from 
        Queries q
)t