-- /* Write your T-SQL query statement below */
-- select 
--     *
-- from (
--     select 
--         player_id, 
--         min(event_date) as first_date
--     from
--         Activity a
-- )t


-- group by
--     player_id
select
    round(
        avg(
            case
                when a.player_id is not null then 1.0
                else 0.0
            end
        ),
        2
    ) as fraction
from 
    Activity a
right join (
    select 
        player_id, 
        min(event_date) as first_date
    from
        Activity a
    group by
        player_id
)t on a.player_id = t.player_id and a.event_date = dateadd(day, 1, t.first_date)
