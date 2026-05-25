use sqlchallange;

-- 1.Index optimization
-- a. analyze query before index
explain analyze
select e.emp_name,s.salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id

-- apply index
create index idx_emp_emp_id
on clean_employees(emp_id);
create index idx_sal_emp_id
on clean_salaries(emp_id);


-- ab. analyze query after index
explain analyze
select e.emp_name,s.salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id


-- 2.Composite index
-- a. analyze query before composite index
explain analyze
select e.emp_name,s.salary,s.salary_date
from clean_employees e  
join clean_salaries s
on e.emp_id=s.emp_id
where s.salary_date='2023-10-15';

-- apply composite index
create index idx_emp_sal_date   
on clean_salaries(emp_id, salary_date);

-- after composite index
explain analyze
select e.emp_name,s.salary,s.salary_date
from clean_employees e  
join clean_salaries s
on e.emp_id=s.emp_id
where s.salary_date='2023-10-15';

-- 3.emp_id=101,apply index & analyze
explain analyze
select e.emp_name,s.salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id
where e.emp_id=101;

create index idx_emp_id2
on clean_employees(emp_id);

-- after index
explain analyze
select e.emp_name,s.salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id
where e.emp_id=101;





