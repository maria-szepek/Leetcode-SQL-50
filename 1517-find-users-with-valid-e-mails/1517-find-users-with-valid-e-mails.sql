/* Write your T-SQL query statement below */
select 
    * 
from 
    Users 
where 

    mail LIKE '[A-Za-z]%' -- start with letter 
    AND BINARY_CHECKSUM(RIGHT(mail, 13)) = BINARY_CHECKSUM('@leetcode.com')
    -- AND RIGHT(mail, 13) = '@leetcode.com'
    -- LIKE '%[abc]%': at least one allowed character 
    -- NOT LIKE '%[^abc]%' not least one character outside of the allowed characters 
    AND LEFT(mail, LEN(mail) - 13) NOT LIKE '%[^A-Za-z0-9_.-]%'; 
-- mail LIKE '[a-zA-Z]+[A-Za-z0-9_.-]+@leetcode.com'
-- mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$' 
    -- REGEXP_LIKE(mail, '^[A-Za-z]+[A-Za-z0-9_.-]+@leetcode.com');