-- Active: 1777291222537@@127.0.0.1@3306@sqlchallange
-- Active: 1777291222537@@127.0.0.1@3306@sqlchallange
use sqlchallange

-- employees/salaries/performance

-- employee


with cte as(
    select *,row_number() over(partition by emp_id,emp_name,
    city order by emp_id)as rn
    from clean_employees
)
delete from clean_employees
where emp_id in 
(select emp_id from cte where rn > 1)

select emp_id,emp_name,city,count(*) as count
from clean_employees
group by emp_id,emp_name,city
having count(*) > 1;


-- salaries table
with cte as(
    select *,row_number() over(partition by salary_id,emp_id,
    salary order by salary_id)as rn
    from clean_salaries
)
delete from clean_salaries
where salary_id in(
    select salary_id from cte where rn > 1
)


select salary_id,emp_id,salary
from clean_salaries
group by salary_id,emp_id,salary
having count(*) > 1;

-- performance table

WITH cte as(select *,row_number() over(
    partition by emp_id,rating_2022,rating_2023,
    rating_2024 order by emp_id)as rn
from clean_performance
)
delete from clean_performance
where emp_id in(
    select emp_id from cte where rn > 1
)

SELECT emp_id,rating_2022,rating_2023,rating_2024
FROM clean_performance  
group by emp_id,rating_2022,rating_2023,rating_2024
having count(*) > 1;



-- subtask-2 Indetify text inconsitency
-- city from clean_employees

select distinct city from clean_employees;

select distinct dept_name from clean_departments;


update clean_employees
set city=concat(upper(left(city,1)),lower(substring(city,2)));

-- performance 
update clean_employees
set city=case
when city in('Dlhi','Delhi ncr','New delhi') then 'Delhi'
when city in('Hydbd','Hydrabad') then 'Hyderabad'
when city in('Bangalore') then 'Bengaluru'
WHEN TRIM(city) = 'Bangalore' THEN 'Bengaluru'
When Trim(city)='chennai' then 'Chennai'
else  city 
end;

