use sqlchallange;

-- 1.current salary +previous salary
select emp_id,salary,salary_date,
lag(salary) over(partition by emp_id order by salary_date)as Prev_salary
from clean_salaries


-- 2. difference between current salary and previous salary
select emp_id,salary,salary_date ,lag(salary) over(partition by emp_id order by salary_date)as prev_salary
,salary - lag(salary) over(partition by emp_id order by salary_date)as diff_salary
from clean_salaries

-- 3.attendence trend(check if attendance improve or decline)
select emp_id,attendance_date,status,lag(status) over(partition by emp_id order by attendance_date)as prev_att_status
from clean_attendance