use sqlchallange;

/*Corelated subquery*/
-- 1.Employees earning more than department the average salary

select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_employees e1
join clean_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary >
(
select avg(s.salary)
from clean_salaries s
join clean_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id
)

-- 2.list of those employees whose salary=highest salary per department

select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_employees e1
join clean_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary =
(
select max(s.salary) as max_salary
from clean_salaries s
join clean_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id)

-- 3 list of those employees whose salary=lowest salary per department


select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_employees e1
join clean_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary =
(
select min(s.salary) as min_salary
from clean_salaries s
join clean_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id)
