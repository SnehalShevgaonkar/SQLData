use sqlchallange;

-- 1. salary running total(cumulative salary)
select emp_id,salary,Salary_date,
sum(salary) over(partition by emp_id order by salary_date)as running_salary
from clean_salaries

-- 2. attendance running count(find total attendance count over time)
select emp_id,status,attendance_date,
count(status) over(partition by emp_id order by attendance_date)as total_cnt_attendance,

from clean_attendance

-- 3.department cumulative salary(tot salary accumulated in each depatment over time)
/* select e.emp_id,e.dept_id,s.salary,s.salary_date,
sum(s.salary) over(patition by e.dept_id order by s.salary_date) as tot_acc_salary 
from clean_employees e
join clean_salaries sn_salaries s
on 
e.emp_id=s.emp_id */


SELECT 
    e.emp_id,
    e.dept_id,
    s.salary,
    s.salary_date,
    SUM(s.salary) OVER(PARTITION BY e.dept_id ORDER BY s.salary_date) AS tot_acc_salary
FROM clean_employees e
JOIN clean_salaries s ON e.emp_id = s.emp_id;




