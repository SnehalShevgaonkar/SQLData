use sqlchallange;


/*Count functions*/
-- 1. Employee with more than 2 salary records
select emp_id,count(*) as total_salary_records
from clean_salaries
group by emp_id
having count(*) > 2;

-- 2. Department with more than 3 employees
select dept_id,count(*) as total_employees
from clean_employees
group by dept_id
having count(*) > 3;

--3.Employee with total salary greater than 100000
select emp_id,sum(salary) as total_salary
from clean_salaries
group by emp_id
having sum(salary) > 100000;

-- 4.department with high average salary
select dept_id,avg(salary) as average_salary
from clean_salaries s
join clean_employees e
 on s.emp_id = e.emp_id
group by dept_id    
having avg(salary) > 50000;
