use sqlchallange;

create table cleaned_customers
as
select *    
from row_customers;


create table cleaned_order_details
as
select *    
from row_order_details;

create table cleaned_orders
as
select *    
from row_orders;

create table cleaned_payment
as  
select *
from row_payment;

create table cleaned_products
as
select *
from row_products;


select * from cleaned_customers;

select * from cleaned_order_details;

select * from cleaned_orders;

select * from cleaned_payment;

select * from cleaned_products;