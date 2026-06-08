use sqlchallange;

-- before insert trigger
-- goal inserting -ve salary is 0

create trigger before_insert_employee
before insert on clean_salaries
for each row    
begin
    if new.salary < 0 then
        set new.salary = 0;
    end if;
end;

insert into clean_salaries (salary_id, emp_id,salary,salary_date) values (501,301,-5000, '2024-01-01');    

select * from clean_salaries where salary_id = 501;

-- 2.after update trigger whenever salary changes save old salary & new salary
 create table salary_log(emp_id int,old_salary int,new_salary int,date datetime);  

 create trigger after_update_employee
 after update on clean_salaries
    for each row    
begin
    insert into salary_log(emp_id,old_salary,new_salary,date) values (new.emp_id,old.salary,new.salary,current_timestamp);
end;

update clean_salaries set salary = 6000 where salary_id = 501;

select * from salary_log 

