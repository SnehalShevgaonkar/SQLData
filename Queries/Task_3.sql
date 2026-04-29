use sqlchallange;

update clean_employees
set emp_name='Unknown'
where emp_name is null or emp_name=''

-- emp_id 13

update clean_employees
set city='Delhi'
where emp_id=13

update clean_employees
set city='Delhi NCR'
where city is null or city=''

-- rating_2023-0 

update clean_performance
set rating_2023=0
where  rating_2023 =''

-- Find duplicate Value
-- employees
select emp_id,emp_name,city,count(*)
from clean_employees
group by emp_id,emp_name,city
having count(*)>1;

--departments
/*select dept_id,
dept_name,
count(*)
from clean_departments
group by dept_id,
    dept_name
having count(*) > 1;*/

select distinct dept_id,dept_name
from clean_departments

--salaries
/*select salary_id,emp_id,salary,count(*)
from clean_salaries 
group by salary_id,emp_id,salary
having count(*)>1;*/

    select distinct salary_id,emp_id,salary
    from clean_salaries

    -- performance
   /* select emp_id,rating_2022,rating_2023,rating_2024,count(*)
    from clean_performance  
    group by emp_id,rating_2022,rating_2023
    having count(*)>1;*/

    select distinct emp_id,rating_2022,rating_2023,rating_2024
    from clean_performance

-- attendence
/* select attendance_id,attendance_date,status,count(*)
from clean_attendance
group by attendance_id,attendance_date,status
having count(*)>1;*/

select distinct attendance_id,attendance_date,status
from clean_attendance