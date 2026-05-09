use sqlchallange;

-- 1.Salary category(low<30000,medium=300000-60000,high>60000 )
select emp_id,Salary,

case 
when salary <30000 then 'Low'
when salary between 30000 and 60000 then 'Medium'
else 'High'
end as Salary_Category
from clean_salaries;


-- 2.performance rating category (low<3,medium=3-4,high>4)
select emp_id,(rating_2022+rating_2023+rating_2024)/3 as Average_Rating,
case 
when (rating_2022+rating_2023+rating_2024)/3 <3 then 'Low'
when (rating_2022+rating_2023+rating_2024)/3 between 3 and 4 then 'Medium'
else 'High'
end as Performance_Category
from clean_performance;

-- 3.attendance status category(Present=Active,Absent=Inactive )
select emp_id,status,
case
when status='Present' then 'Active'
else
'Inactive'

end as Attendance_Category
from clean_attendance;

-- 4.emp_id,year(curdate())-year(hire_date) as Experience_year
select emp_id,year(curdate())-year(hire_date) as Experience_year,
case
when year(curdate())-year(hire_date)<2 then 'Freshers'
WHEN year(curdate())-year(hire_date) between 2 and 5 then 'Mid-level'
else 'Experienced'
end as Experience_Category
from clean_employees;

