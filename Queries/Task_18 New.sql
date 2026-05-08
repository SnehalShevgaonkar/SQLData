use sqlchallange;

-- 1.Employees where average performance rating >4
select e.emp_name ,e.emp_id,d.dept_name,(p.rating_2022+p.rating_2023+p.rating_2024)/3 as average_rating
from clean_employees e
join clean_departments d
 on e.dept_id = d.dept_id
join clean_performance p
 on e.emp_id = p.emp_id
where (p.rating_2022+p.rating_2023+p.rating_2024)/3 > 4;

-- 2.employees with more than 10 present days
select e.emp_name,e.emp_id,count(a.attendance_id) as present_days
from clean_employees e
join clean_attendance a
on e.emp_id=a.emp_id
where a.status='Present'
group by e.emp_id,e.emp_name
having count(a.attendance_id) > 2;

-- 3.Department were total salary>200000
select d.dept_id,d.dept_name,e.emp_id,sum(s.salary)as total_salary
from clean_departments d
join clean_employees e
on d.dept_id=e.dept_id
join clean_salaries s
on e.emp_id=s.emp_id
group by d.dept_id,d.dept_name,e.emp_id
having sum(s.salary) > 200000;

-- 4.employees whose total salary >dept average salary
select e.emp_name,e.emp_id,d.dept_name,s.salary
from clean_employees e
join clean_departments d
 on e.dept_id = d.dept_id
join (
    select e.emp_id, avg(s.salary) as avg_salary
    from clean_employees e
    join clean_salaries s on e.emp_id = s.emp_id
    group by e.emp_id
) dept_avg
 on e.emp_id = dept_avg.emp_id

join clean_salaries s
 on e.emp_id = s.emp_id 
where s.salary > dept_avg.avg_salary;