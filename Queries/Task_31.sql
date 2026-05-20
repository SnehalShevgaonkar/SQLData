use sqlchallange;

-- 1.employees whose total salary is>100000
-- a.tot salary per emp & b.>100000

with emp_total_sal as(
    select emp_id,sum(salary) as tot_salary
    from clean_salaries
    group by emp_id),high_earners as(
        select * from emp_total_sal
        where tot_salary>100000
    )

select *
from high_earners

-- 2.show employees salary along with department avg salary
    
with dept_avg_sal as(
    select e.dept_id,avg(s.salary) as dept_avg  
    from clean_employees e
    join clean_salaries s
    on e.emp_id=s.emp_id
    group by e.dept_id),
emp_dept_sal as(
    select e.emp_id,e.dept_id,s.salary,d.dept_avg
    from clean_employees e
    join clean_salaries s
    on e.emp_id=s.emp_id
    join dept_avg_sal d 


)
select *from emp_dept_sal

-- 3. department with higest saalry per dept
-- 1.tot salaty per dept & 2. max salary per dept

with dept_total_sal as(
    select e.dept_id,sum(s.salary) as tot_salary
    from clean_employees e
    join clean_salaries s
    on e.emp_id=s.emp_id
    group by e.dept_id),max_dept_sal as(
        select dept_id,max(tot_salary) as max_dept_salary
        from dept_total_sal
        group by dept_id
    )
select *
from max_dept_sal