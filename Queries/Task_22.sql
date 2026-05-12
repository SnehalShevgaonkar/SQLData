use sqlchallange;

-- 1.department average salary(show each employees avg salaryof their department)
select e.emp_id,e.dept_id,s.salary,
avg(s.salary) over(partition by e.emp_id) as dept_avg_salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id;


-- 2.total salary if each department(emp_id,dept_id,salary)
select e.emp_id,e.dept_id,s.salary,
sum(s.salary) over(partition by e.dept_id) as tot_sal
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id

-- 3. average performance of each dept(emp_id,dept_id)
select e.emp_id,e.dept_id,
avg((p.rating_2022+p.rating_2023+p.rating_2024)/3.0) 
over(partition by e.dept_id)as avg_perform
from clean_employees e
join clean_performance p
on e.emp_id=p.emp_id