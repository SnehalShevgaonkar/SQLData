use sqlchallange;

-- 1.Create employee view(find create and using view in sql)

create view Emp_view as
select emp_id,emp_name,dept_id,city
from clean_employees;

select * from Emp_view
where city='Mumbai'

-- 2. create salary view
create view salary_view as
select emp_id,salary,salary_date
from clean_salaries

select * from salary_view
where emp_id=355

-- 3.create emp_sal_view
create view emp_sal_view as
select e.emp_id,e.emp_name,e.dept_id,s.salary,s.salary_date
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id

-- 4.use above view to finding data where salary>50000
select *
from emp_sal_view
where salary>50000
