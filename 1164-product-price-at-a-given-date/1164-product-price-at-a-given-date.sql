-- /* Write your T-SQL query statement below */
select distinct 
    p.product_id,
    coalesce(t.price, 10) price 
from 
    Products p
left join (
    select distinct
        product_id,
        first_value(new_price) over (partition by product_id order by change_date desc) price
    from 
        Products 
    where 
        change_date <= '2019-08-16'
)t on p.product_id = t.product_id 



