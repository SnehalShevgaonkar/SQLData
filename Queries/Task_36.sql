use sqlchallange;
-- 1.CREATING THE PROCEDURE to get emp data

create procedure get_employee_data()
begin 
select * from clean_employees;
end;

call get_employee_data();

-- 2. procedure with input parameter
create procedure get_emp_id(in emp_id_input int)
begin
    select * from clean_employees where emp_id = emp_id_input;
end;

call get_emp_id(110);

-- 3.procedure with join(emp & salary details)

create procedure get_emp_sal_details()
begin 
select e.emp_id, e.emp_name, s.salary, s.salary_date
from clean_employees e
join clean_salaries s   
on e.emp_id=s.emp_id;
end;

call get_emp_sal_details();

-- 4.generate the salary report(where salary>50000)
create procedure get_high_salary()
begin
select *
from clean_salaries
where salary>50000;
end;

call get_high_salary();