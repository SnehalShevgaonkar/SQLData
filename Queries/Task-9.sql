use sqlchallange;
/*Joins*/
-- 1. Find the employee who have joined the department
select e.emp_id,e.emp_name,d.dept_name
from clean_employees e
join clean_departments d
on e.dept_id=d.dept_id;

-- 2. Find the employee who have joined the department and also find the manager name
select e.emp_id,e.emp_name,d.dept_name
from clean_employees e
left join clean_departments d
on e.dept_id=d.dept_id;

-- 3. list of all employees without department
select e.emp_id,e.emp_name,d.dept_name
from clean_employees e
left join clean_departments d
on e.dept_id=d.dept_id
where d.dept_id IS NULL;

-- 4.Find e8mployees who earn how much
select e.emp_id,e.emp_name,s.salary
from clean_employees e  
join clean_salaries s
on e.emp_id=s.emp_id;


-- 5.List Employees without salary
select e.emp_id,e.emp_name,s.salary
from clean_employees e
left join clean_salaries s
on e.emp_id=s.emp_id
where s.emp_id IS NULL;