-- /* Write your T-SQL query statement below */

select round(sum(tiv_2016),2) tiv_2016 from 
(
    select distinct 
        i15.*
        -- round(sum(i15.tiv_2016), 2) tiv_2016
    from 
        Insurance i15
    join 
        Insurance i16 on i15.tiv_2015 = i16.tiv_2015
    where i15.pid <> i16.pid
    and i15.pid not in (
        select distinct 
            i1.pid 
        from 
            Insurance i1
        join
            Insurance i2 on i1.lat=i2.lat and i1.lon=i2.lon
        where i1.pid != i2.pid 
    )
)t


