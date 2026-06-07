use sqlchallange;
-- 1.before update trigger(prevent negative salary)

create trigger prevent_negative_salary
before update on clean_salaries
for each row
begin
if new.salary <0 then
set new.salary=old.salary;
end if;
end;    

select * from clean_salaries where emp_id=210;

update clean_salaries
set salary=1000
where emp_id=210;

-- 2. After insert trigger (attendance login)

create table attendance_log1(
    
    emp_id int,
    attendance_date date,
    message varchar(255)
);


 create trigger attendance_insert_log
 after insert on clean_attendance
    for each row
    begin
    insert into attendance_log1(emp_id,attendance_date,message)
    values(new.emp_id,new.attendance_date,'New employee added');
    
    end;

    select * from attendance_log

    insert into clean_attendance
    values(2026101,111,'2026-6-6','present');

    ALTER TABLE attendance_log1 
MODIFY COLUMN id INT AUTO_INCREMENT;

DESCRIBE clean_attendance;
DESCRIBE attendance_log1;
