-- Write an SQL query to find the most recent three orders of each user. If a user ordered less than three orders, return all of their orders.

-- Return the result table ordered by customer_name in ascending order and in case of a tie by the customer_id in ascending order. 
-- If there is still a tie, order them by order_date in descending order.

-- The query result format is in the following example.

with temp as (
    select
        c.name customer_name,
        c.customer_id,
        o.order_id,
        o.order_date,
        rank() over (partition by c.customer_id order by o.order_date desc) rnk
    from customers c 
        inner join orders o
            on c.customer_id = o.customer_id
)
select
    customer_name,
    customer_id,
    order_id,
    order_date
from temp t 
where rnk <= 3
order by customer_name, customer_id, order_date desc;