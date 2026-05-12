use sqlchallange;

-- 1. rank employees by salary

select emp_id,salary,
rank() over(order by salary desc)as salary_rnk
from clean_salaries

-- 2.department wise ranking(rank employee inside each department)
select e.emp_id,e.dept_id,s.salary,
dense_rank() over(partition by e.dept_id order by e.emp_id)as dept_rank
from clean_employees e
join clean_salaries s on e.emp_id=s.emp_id

-- 3. top performer(calculaate avg.rating)

select emp_id,(rating_2022+rating_2023+rating_2024/3) as avg_rating
,dense_rank() over(order by rating_2022+rating_2023+rating_2024/3 desc)as perfromance_rnk
from clean_performance 

--4.salary ranking top 3 eplomyees
SELECT emp_id, salary,
       dense_rank() OVER(partition by emp_id ORDER BY salary DESC) as top_rnk
FROM clean_salaries
WHERE salary >= 1