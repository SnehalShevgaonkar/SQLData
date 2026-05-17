use sqlchallange;

-- 1.latest salary per employee along with latest salary till that point
select *
from 

(select emp_id,salary_date,salary,
row_number() over(partition by emp_id order by salary_date desc) as rnk,
sum(salary) over(partition by emp_id order by salary_date) as running_total
from clean_salaries)t
where rnk=1;

-- 2.Rank employees based on salary and compare with dept avg

SELECT *
FROM (
    SELECT 
        e.emp_id,
        e.dept_id,
        s.salary,
        DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary DESC) as dept_salary_rank,
        AVG(s.salary) OVER(PARTITION BY e.dept_id) as dept_avg_salary,
        CASE 
            WHEN s.salary > AVG(s.salary) OVER(PARTITION BY e.dept_id) THEN 'salary above dept avg'
            ELSE 'salary below dept avg' 
        END as salary_comparison
    FROM clean_employees e
    JOIN clean_salaries s ON e.emp_id = s.emp_id
) t
WHERE salary_comparison = 'salary above dept avg';

-- 3.check if salary is increasing or decrease compare to previous

select e.emp_id,e.dept_id,s.salary_date,s.salary,
lag(s.salary) over(partition by e.emp_id order by s.salary_date) as prev_salary,
case when s.salary > lag(s.salary) over(partition by e.emp_id order by s.salary_date) then 'salary increase'
     when s.salary < lag(s.salary) over(partition by e.emp_id order by s.salary_date) then 'salary decrease'
     else 'no change' end as salary_trend   
from clean_employees e
join clean_salaries s   
on e.emp_id=s.emp_id;
