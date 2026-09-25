/* Write your T-SQL query statement below */
select 
    sell_date,
    count( product) num_sold,
    string_agg(product, ',') WITHIN GROUP (ORDER BY product ASC) products
from (select distinct * from Activities) a
group by sell_date
