-- 1.departments
select * from clean_departments
where dept_name is null or dept_name = ''
or dept_id is null or dept_id = '';

-- 2.employees
select * from clean_employees
where emp_name is null or emp_name = ''
or
emp_id is null or emp_id = ''
or
age is null or age = ''
or
city is null or city = ''
or  
dept_id is null or dept_id = ''  
or
 hire_date is null or hire_date = '';


-- 3.salaries
 select * from clean_salaries
 where emp_id is null or emp_id = ''
 or
 salary_id is null or salary_id = ''
 or 
 salary is null or salary = ''  
 or
 salary_date is null or salary_date = '';

 -- 4.attendance

 select * from clean_attendance
 where emp_id is null or emp_id = ''
 or
 attendance_id is null or attendance_id = ''
 or
    attendance_date is null or attendance_date = ''
    or
    status is null or status = '';



-- 5.performance

    select * from clean_performance
    where emp_id is null or emp_id = ''
    or
    rating_2022 is null or rating_2022  = ''
    or
    rating_2023 is null or rating_2023 = ''
    or
    rating_2024 is null or rating_2024 = '';    