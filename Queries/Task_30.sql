use sqlchallange;

-- 1.create a temp table and use it
with salary_cte as(
    select emp_id,salary
    from clean_salaries
)
select  *
from salary_cte
where emp_id=58


-- 2. combine emp & salaries table using cte

with emp_salary as(
   select e.emp_id,e.dept_id,s.salary
    from clean_employees e
    join clean_salaries s   
    on e.emp_id=s.emp_id
)
select *
from emp_salary
where emp_id=58

-- 3.Calculate department average salary using cte

with dept_sal as(select e.emp_id ,e.dept_id,avg(s.salary) as avg_salary
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id  
group by e.dept_id,e.emp_id)

select * from dept_sal

-- 4. find the emloyees earning more than dept ave

with dept_cte as(
    select e.emp_id,e.dept_id, s.salary,avg(s.salary) over(partition by e.dept_id) as dept_avg
from clean_employees e  
join clean_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.dept_id,s.salary
)
select *
from dept_cte
where salary>dept_avg
