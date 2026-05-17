use sqlchallange;

-- 1.top  2 department(top 2highest paid employee in each dept)

select *
from
(select e.emp_id,e.dept_id,s.salary ,
dense_rank() over(partition by dept_id order by salary desc) as rnk
from clean_employees e
join clean_salaries s
on e.emp_id=s.emp_id) t
where rnk<=2


-- 2.slary gap(difference between currentsalary and prev salary)

select emp_id,salary,salary_date,
lag(salary) over(partition by emp_id order by salary_date)as prev_salary,
salary-lag(salary)over(partition by emp_id order by salary_date)as salary_gap
from clean_salaries;

-- 3.performance gap(change in performance  between years)
    select emp_id,rating_2022,rating_2023,rating_2024,
    rating_2023-rating_2022 as perf_gap_22_23,
    rating_2024-rating_2023 as perf_gap_23_24
    from clean_performance;

-- 4.rank filtering(top perrformance based on their salary)
    select *
    from
    (select e.emp_id,e.dept_id,s.salary,
    dense_rank() over(partition by dept_id order by salary desc) as rnk
    from clean_employees e
    join clean_salaries s
    on e.emp_id=s.emp_id)t  
    where rnk=1
