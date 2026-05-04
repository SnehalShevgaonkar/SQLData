use sqlchallange;

-- Converting data type of clean_employees.
alter table clean_employees
modify emp_id int, 
modify emp_name varchar(25),
modify age int,
modify city varchar(20),
modify hire_date date;

describe clean_employees;

-- Converting data type of clean_departments
    alter table clean_departments
    modify dept_id int, 
    modify dept_name varchar(25);    

    describe clean_departments;

  -- Converting data type of clean_salaries
    alter table clean_salaries
    modify emp_id int, 
    modify salary decimal(10,2),
    modify salary_date date,
    modify is_outlier int;    

    describe clean_salaries;  

    -- Converting data type of clean_attendance
    alter table clean_attendance
    modify attendance_id int,
    modify emp_id int,
    modify attendance_date date,
    modify status varchar(10);

    describe clean_attendance;

    -- Converting data type of clean_performance
    alter table clean_performance
    modify emp_id int,
    modify rating_2022 int,
    modify rating_2023 int,
    modify rating_2024 int;

    describe clean_performance;