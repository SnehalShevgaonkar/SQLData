use sqlchallange;

alter table clean_salaries
modify salary int

-- basic understanding

select min(salary) as min_salary, 
max(salary) as max_salary,
avg(salary) as avg_salary
from clean_salaries
where salary>0  

-- client rules max=200000 and min=20000
alter table clean_salaries
Add column is_outlier int;

select * 
from clean_salaries
where is_outlier=1;

update clean_salaries
set is_outlier=
case
when 
 salary <20000 or salary >200000 then 1
else 0
end;