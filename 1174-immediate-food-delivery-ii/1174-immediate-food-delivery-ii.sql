/* Write your T-SQL query statement below */
select
    round((1.0 * sum(immediate_order) / count(*)) * 100, 2)  as immediate_percentage 
from (
    select 
        d.*,
        case 
            when order_date = customer_pref_delivery_date then 1
            else 0
        end as immediate_order,
        first_value(order_date) over (partition by customer_id order by order_date) as first_order_date
    from Delivery d
)t
where order_date = first_order_date 


