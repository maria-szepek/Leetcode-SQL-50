/* Write your T-SQL query statement below */
-- with triangle inequality theorem short cut 
select 
    *,
    case 
        when x + y > z and x + z > y and y + z > x then 'Yes'
        else 'No' 
    end triangle
from 
    Triangle