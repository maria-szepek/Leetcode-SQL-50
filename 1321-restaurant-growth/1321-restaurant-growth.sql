/* Write your T-SQL query statement below */
select
    visited_on,
    round(amount, 2) amount,
    round(average_amount, 2) average_amount
from (
    select 
        visited_on,
        sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount,
        avg(amount) over (order by visited_on rows between 6 preceding and current row) as average_amount
    from (
        select 
            visited_on,
            sum(cast(amount as numeric)) amount
        from
            Customer
        group by 
            visited_on
    )revenues_per_day
)rolling_average_revenues
order by 
    visited_on
offset 6 rows

