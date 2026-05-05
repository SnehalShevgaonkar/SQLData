use sqlchallange;

-- 1.What are performance of each query?
select e.emp_id,e.emp_name,p.rating_2022,p.rating_2023,p.rating_2024
from clean_employees e
join clean_performance p
on e.emp_id = p.emp_id

-- 2 which query do not have salary records?
select e.emp_id,e.emp_name
from clean_employees e
left join clean_salaries s
on e.emp_id = s.emp_id
where s.emp_id is null

-- 3 which employees do not have attendance record?
select e.emp_id,e.emp_name
from clean_employees e  
left join clean_attendance a
on e.emp_id = a.emp_id
where a.emp_id is null

-- 4 what is the employee name,depatment,salary together?
select e.emp_id,e.emp_name,d.dept_name,s.salary
from clean_employees e
join clean_departments d
on e.dept_id = d.dept_id    
join clean_salaries s
on e.emp_id = s.emp_id  
