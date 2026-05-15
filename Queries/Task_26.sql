use sqlchallange;
-- 1.find rank of employee within each department based on salary
select e.emp_id,e.dept_id,s.salary,
dense_rank(s.salary) over (partition by e.dept_id order by s.salary) as emp_rank
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id


-- 2.compare each employee salary with their department average salary(salary>avg salary  'above salary' salary<avg salary 'below salary')
select e.emp_id,e.dept_id,s.salary,
avg(s.salary) over (partition by e.dept_id) as avg_salary,
case 
when s.salary > avg(s.salary)  over(partition by e.dept_id) then 'Above Average'
when s.salary < avg(s.salary) over(partition by e.dept_id) then 'Below Average'
else
'Equal Salary'
end as comparision 
from clean_employees e
join clean_salaries s
on e.emp_id =s.emp_id

-- 3.find top 3 highest paid salary in each dept
select e.emp_id,e.dept_id, s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc) as salary_rank

from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id
where s.salary <= 3

/*WITH RankedSalaries AS (
    SELECT 
        e.emp_id,
        e.dept_id, 
        s.salary,
        DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) as salary_rank
    FROM clean_employees e
    JOIN clean_salaries s ON e.emp_id = s.emp_id
)
SELECT 
    emp_id,
    dept_id,
    salary
FROM RankedSalaries
WHERE salary_rank <= 3;*/

