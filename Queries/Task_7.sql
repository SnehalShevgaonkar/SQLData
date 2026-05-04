-- Active: 1777291222537@@127.0.0.1@3306@sqlchallange
use sqlchallange;


-- step 1:Remove month(invalid)>12 for clean_employees
/*
  25-08-2022=25-08=15>12
*/
update clean_employees
set hire_date=null
where
cast(substring_index(substring_index(hire_date,'-',2),'-',-1)As unsigned)>12;


-- step2:DD-MM-YYYY to YYYY-MM-DD
-- 28-08-2024=2024-08-28
update clean_employees
set hire_date=
concat(RIGHT(hire_date,4),'-',substring(hire_date,4,2),'-',LEFT(hire_date,2))
where hire_date like '__-__-____';

-- step3:Remove invalid date
update clean_employees
set hire_date=null
where
cast(right(hire_date,2)As unsigned)>31;


select distinct hire_date
from clean_employees

-- replace null & empty values with '2024-02-25'
    update clean_employees
    set hire_date='2024-02-25'
    where hire_date is null;

-- step 1:DD-MM-YYYY to YYYY-MM-DD for clean_salaries
update clean_salaries
set salary_date=
concat(RIGHT(salary_date,4),'-',substring(salary_date,4,2),'-',LEFT(salary_date,2))
where salary_date like '__-__-____';   
-- step 2:Remove invalid date for clean_salaries
update clean_salaries
set salary_date=null
where
cast(right(salary_date,2)As unsigned)>31;

select distinct salary_date
from clean_salaries

-- step 1 DD-MM-YYYY to YYYY-MM-DD for clean_attendance
update clean_attendance
set attendance_date=
concat(RIGHT(attendance_date,4),'-',substring(attendance_date,4,2),'-',LEFT(attendance_date,2))
where attendance_date like '__-__-____';   

select distinct attendance_date
from clean_attendance

