use sqlchallange;

-- 1.procedure with if condition(find return message based on salary)

create procedure salary_check_data(in emp int)
begin
declare sal int;
select salary into sal
from clean_salaries
where emp_id=emp;

if sal > 50000 then
    select 'High Salary' as message;
else
    select 'low Salary' as message;
end if;
end

call salary_check_data(210);    


-- 2.procedure with case(categorise the employees based on salary: >70000 as high, >40000 as medium, else low)

create procedure emp_sal_category(in emp int)
begin
declare sal int;

select salary into sal
from clean_salaries
where emp_id=emp;
case 
when sal > 70000 then
    select 'High Salary' as category;
when sal > 40000 then
    select 'Medium Salary' as category;
else
    select 'Low Salary' as category;
end case;
end;    

call emp_sal_category(210);


-- 3.Procedure with aggregate functions(find total salary per empoyees)

create procedure tot_sal_emp()
begin 
select emp_id,sum(salary) as total_salary
from clean_salaries
group by emp_id;
end;

call tot_sal_emp();