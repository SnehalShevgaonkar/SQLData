use sqlchallange;

-- 1.update employee data using a view
 create view employee_view as
 select emp_id,emp_name,city
 from clean_employees

select * from employee_view;

 update employee_view
 set city='Mumbai'
 where emp_id=110

 -- 2.create view for high salary employees where salary>50000 & use this view to fetch
 create view high_Salary_empview as
 select e.emp_id,e.emp_name,s.salary
 from clean_employees e
 join clean_salaries s on e.emp_id = s.emp_id
 where s.salary>50000

 select * from high_Salary_empview

 -- 3.Multitable view combine emp+sal+dept tables
 create view emp_sal_dept_view as
 select e.emp_id,e.emp_name,d.dept_id,d.dept_name,s.salary
 from clean_employees e
 join clean_salaries s on e.emp_id=s.emp_id
 join clean_departments d on e.dept_id=d.dept_id

 select * from emp_sal_dept_view

 -- 4.hr wants high salary employees with dept name (HR_DASHBOARD)
    create view hr_dashboard11 as
    select e.emp_id,e.emp_name,d.dept_name,s.salary
    from clean_employees e  
    join clean_salaries s on e.emp_id=s.emp_id
    join clean_departments d on e.dept_id=d.dept_id
    where s.salary>50000
    select * from hr_dashboard11
