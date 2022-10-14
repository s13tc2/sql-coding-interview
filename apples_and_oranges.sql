-- Write an SQL query to report the difference between the number of apples and oranges sold each day.
-- Return the result table ordered by sale_date.

-- https://leetcode.com/problems/apples-oranges/

select
    sale_date,
    sum(case when fruit='apples' then sold_num else -sold_num end) as diff
from sales
group by 1;