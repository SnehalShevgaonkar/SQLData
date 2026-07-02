-- ECommerce Salaes Analysis Project
use sqlchallange;

create table row_customers(
    customer_id varchar(50),
    customerr_name varchar(100),
    city varchar(50),
    signup_date varchar(50)
);

create table row_orders(
    order_id varchar(50),
    customer_id varchar(50),
    order_date varchar(50)
);

create table row_products(
    product_id varchar(50),
    product_name varchar(50),
    category varchar(50),
    price varchar(50)
);

create table row_order_details(
    order_detail_id varchar(50),
    order_id varchar(50),
    product_id varchar(50),
    quantity varchar(50)
);

create table row_payment(
    payment_id varchar(50),
    order_id varchar(50),
    payment_amount varchar(50),
    payment_date varchar(50)
);

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

drop table row_products;
drop table cleaned_products;


select * from cleaned_customers;

select * from cleaned_order_details;

select * from cleaned_orders;

select * from cleaned_payment;

select * from cleaned_products;