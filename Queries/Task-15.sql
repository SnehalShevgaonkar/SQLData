use sqlchallange;

-- 1.Employees with salaries reccord (atleast one)
select e.emp_id,e.emp_name
from clean_employees e
where exists(
    select 1
    from clean_salaries s1
    where s1.emp_id = e.emp_id
)

-- 2.Employee without salary
select e.emp_id,e.emp_name
from clean_employees e
where not exists(
    select 1
    from clean_salaries s
    where s.emp_id=e.emp_id
);


-- 3.Employees with attendance
select e.emp_id,e.emp_name
from clean_employees e
where exists(
    select 1
    from clean_attendance a
    where a.emp_id=e.emp_id
);

-- 4.Employees without attendance
select e.emp_id,e.emp_name
from clean_employees e
where not exists(
    select 1
    from clean_attendance a
    where a.emp_id=e.emp_id
);
