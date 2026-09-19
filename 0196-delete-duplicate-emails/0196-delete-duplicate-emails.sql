/* Write your T-SQL query statement below */
with no_duplicates as (
    select
        min(id) as id,
        email
    from 
        Person
    group by
        email
)
delete from Person where id not in (select id from no_duplicates)


