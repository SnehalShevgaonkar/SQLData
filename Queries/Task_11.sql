use sqlchallange;

-- 1.what is the employee name,department and performance rating?
select e.emp_name,d.dept_name,p.rating_2022,p.rating_2023,p.rating_2024
from clean_employees e
join clean_departments d 
on e.dept_id=d.dept_id
join clean_performance p
on p.emp_id=e.emp_id;

-- 2. what is the complete profile of each employee(dept,salary,performance)?
select e.emp_name,e.emp_id,e.dept_id,d.dept_name,s.salary,p.rating_2022,p.rating_2023,p.rating_2024
from clean_employees e
left join clean_departments d
on e.dept_id=d.dept_id
left join clean_salaries s
on s.emp_id=e.emp_id
left join clean_performance p
on p.emp_id=e.emp_id;

-- 3.How many salary record does each employee have?
select e.emp_name,e.emp_id,count(s.salary) as salary_record
from clean_employees e
left join clean_salaries s
on s.emp_id=e.emp_id
group by e.emp_name,e.emp_id;

-- 4.What is the total salary paid to each employee?
select e.emp_name,e.emp_id,sum(s.salary) as total_salary
from clean_employees e  
left join clean_salaries s
on s.emp_id=e.emp_id    
group by e.emp_name,e.emp_id;

