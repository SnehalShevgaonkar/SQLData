use sqlchallange;

-- 1.create an index on emp_id

create index idx_emp_id1
on clean_employees(emp_id);

select * from clean_employees
where emp_id=101;

-- 2.create an index on dept_id

create index idx_dept_id
on clean_departments(dept_id);

select * from clean_departments
where dept_id=10;

-- 3. create a composite index (emp_id,salary_date)
create index idx_emp_id_salary_date
on clean_salaries(emp_id, salary_date);

    
select * from clean_salaries
where emp_id=101 and salary_date='2023-10-15';