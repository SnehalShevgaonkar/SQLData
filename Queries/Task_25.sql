use sqlchallange;

-- 1.current & next salary

select emp_id,salary,salary_date,
lead(salary) over (partition by emp_id order by salary_date)
from clean_salaries

-- 2.growth analysis compare our current salary within next salary
select emp_id,salary,salary_date,
salary - lead(salary) over(partition by emp_id order by salary_date) as next_salary ,
case
when salary < lead(salary) over(partition by emp_id order by salary_date) then 'Growth Salary'
when salary > lead(salary) over(partition by emp_id order by salary_date)then 'No Groth salary'
when lead(salary) over(partition by emp_id order by salary_date) Is Null then 'No Future Salary'
else 'Same Salary'

end
from clean_salaries


-- 3.Trend Prediction(today vs next day)-attendance
select emp_id,attendance_date,status,
lead(attendance_date) over (partition by emp_id order by attendance_date) as Next_day,
lead(status) over (partition by emp_id order by attendance_date) as next_status
from clean_attendance
