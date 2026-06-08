use sqlchallange;

-- 1.create and insert values into temporary table
CREATE TEMPORARY TABLE temp_sal_summary1(emp_id int, total_salary int) 

-- 2. insert values into temp table
  insert into temp_sal_summary1(emp_id, total_salary)values(1, 50000), (2, 60000), (3, 55000);
  select emp_id, sum(salary) 
  from clean_salaries
  group by emp_id;   

  select * from temp_sal_summary;

-- 3.join with emp table
select e.emp_id,e.emp_name,t.total_salary
from clean_employees e
join temp_sal_summary1 t on e.emp_id = t.emp_id;

-- 4.drop temp table
drop temporary table temp_sal_summary1;

select * from temp_sal_summary1; -- this will return an error since the temp table has been dropped.