use sqlchallange;

-- 1.Total,total salary per employee

select e.emp_id,e.emp_name,sum(s.salary) as total_salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name

-- 2. average salary perr employee
select e.emp_id,e.emp_name,avg(s.salary)as Avg_Salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name

-- 3. Count of salary records per employee
select e.emp_id,e.emp_name,count(s.salary) as Salary_Records
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id    
group by e.emp_id,e.emp_name

-- 4. Max salary per employee
select e.emp_id,e.emp_name,max(s.salary) as Max_Salary
from clean_employees e  
join clean_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name