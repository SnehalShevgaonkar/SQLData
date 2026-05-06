use sqlchallange;

/*Using subqueries*/
-- 1.employees earning more than the average salary.
-- calculation==comparision
-- average salary==emp1>avgsalary===result
-- emp1_salary>123456

select e.emp_name, e.emp_id,s.salary
from clean_employees e
join clean_salaries s 
on e.emp_id = s.emp_id
where s.salary > (select avg(salary) from clean_salaries);  

-- 2. employees with salaries equal to maximum salary
-- max salary
-- calculation==comparision
-- max_salary==emp1_salary===result
-- emp1_salary=123456

select e.emp_name, e.emp_id, s.salary
from clean_employees e
join clean_salaries s
on e.emp_id = s.emp_id
where s.salary = (select max(s.salary) from clean_salaries s);

-- 3.employees earning with average salary

select e.emp_name, e.emp_id, s.salary
from clean_employees e  
join clean_salaries s
on e.emp_id = s.emp_id  
where s.salary < (select avg(s.salary) from clean_salaries s);

-- 4. employees with minimum salary
select e.emp_name, e.emp_id, s.salary
from clean_employees e      
join clean_salaries s
on e.emp_id = s.emp_id
where s.salary = (select min(s.salary) from clean_salaries s);