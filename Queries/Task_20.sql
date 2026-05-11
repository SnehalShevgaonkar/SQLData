use sqlchallange;
-- 1. latest salary 
select * from
(select *,
row_number() over(partition by emp_id order by salary_date desc) as rn
from clean_salaries) as t
where rn = 1;


-- 2first salary
select * 
from(select *,
row_number() over(partition by emp_id order by salary_date asc) as rn
from clean_salaries) as t
where rn = 1;

-- 3.ranking per employee(rank salary entries for each employee
select *,
row_number() over(partition by emp_id order by salary_date desc) as rn  
from clean_salaries;

-- 4.get top 2 records per employee
select * from
(select *,  
row_number() over(partition by emp_id order by salary_date desc) as rn  
from clean_salaries) as t
where rn <= 2;
