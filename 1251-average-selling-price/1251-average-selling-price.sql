-- -- /* Write your T-SQL query statement below */
select distinct
    product_id,
    -- total_price_of_product,
    -- number_of_products_sold,
    coalesce(round(cast(total_price_of_product as numeric) / number_of_products_sold, 2), 0) as average_price
from (
    select 
        p.product_id,
        sum(s.units * p.price) over (partition by p.product_id) as total_price_of_product,
        sum(s.units) over (partition by p.product_id) as number_of_products_sold 
    from
        UnitsSold s
    right join Prices p
         on s.product_id = p.product_id
        and s.purchase_date between p.start_date and p.end_date 
)t


