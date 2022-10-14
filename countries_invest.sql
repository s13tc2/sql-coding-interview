-- A telecommunications company wants to invest in new countries. 
-- The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.
-- Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order.

select
    co.name country
from person p
    inner join country co 
        on left(p.phone_number, 3) = co.country_code
    inner join calls c
        on p.id = c.caller_id or p.id = c.callee_id
group by 1
having avg(duration) > (select avg(duration) from calls);