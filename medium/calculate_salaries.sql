-- Write an SQL query to find the salaries of the employees after applying taxes. Round the salary to the nearest integer.
-- The tax rate is calculated for each company based on the following criteria:
--     0% If the max salary of any employee in the company is less than $1000.
--     24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
--     49% If the max salary of any employee in the company is greater than $10000.

-- Return the result table in any order.

-- https://leetcode.com/problems/calculate-salaries/

with temp as (
    select
        company_id,
        case 
            when max(salary) < 1000 then 1.0
            when max(salary) <= 10000 then 0.76
            else 0.51
        end as tax_rate
    from salaries 
    group by 1
)
select 
    s.company_id,
    s.employee_id,
    s.employee_name,
    round(salary * t.tax_rate) as salary
from salaries s
    inner join temp t
        on s.company_id = t.company_id;