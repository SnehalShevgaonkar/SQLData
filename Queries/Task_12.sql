use sqlchallange;

-- 1.what is the average salary in each department?
select d.dept_name,avg(s.salary) as avg_salary
from clean_departments d
join clean_employees e 
on d.dept_id = e.dept_id
join clean_salaries s
on e.emp_id = s.emp_id  
group by d.dept_name;

-- 2.how manny days was each employee present?
select e.emp_name, count(a.attendance_id) as days_present
from clean_employees e
left join clean_attendance a
on e.emp_id = a.emp_id
group by e.emp_name;

-- 3. which employee belongs to same department?
select dept_id, group_concat(emp_name) as employees
from clean_employees 
group by dept_id
having count(*) > 1;

-- 4.Which employee have more than one salary records?
SELECT e.emp_id, e.emp_name, COUNT(s.salary_id) AS salary_count
FROM clean_employees e
JOIN clean_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(s.salary_id) > 1;

