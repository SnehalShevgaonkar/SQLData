use sqlchallange;

-- 1.compare each employee with overall average salary(> avg above avg <avg below avg)
select emp_id,salary,
avg(salary) over() overall_avg_salary,
case 
when salary > avg(salary) over() then 'Above Average'
when salary < avg(salary) over() then 'Below Average'
else 'Equal Salary'
end as comparison
from clean_salaries

-- 2.compare employee salary with total salary of all employee(sum(salary)*!0%-high contributer)
select emp_id,salary,
sum(salary) over() total_salary,
case 
when salary > sum(salary) over() * 0.1 then 'High Contributor'
else 'low Contributor'
end as contribution
from clean_salaries

-- 3.Compare department total salary with overall total (dept_total_salary>30% of total salary --high dept,<30% of total salary--low dept)
select e.emp_id, e.dept_id,s.salary,
sum(s.salary) over(partition by e.dept_id) dept_total_salary,
sum(s.salary) over() overall_total_salary,
case 
when sum(s.salary) over(partition by e.dept_id) > sum(s.salary) over() * 0.3 then 'High Dept'
else 'Low Dept'
end as dept_contribution    
from clean_employees e
join clean_salaries s   
on e.emp_id=s.emp_id