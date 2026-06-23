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


-- 2. Find duplicate Records ffrom cleaned_customers
select customer_id,customerr_name,city, count(*) as duplicate_count
from cleaned_customers
group by customer_id,customerr_name,city
having count(*) > 1;

-- cleaned_ Orders
select order_id,count(*) as duplicate_count
from cleaned_orders
group by order_id
having count(*) > 1;

-- cleaned_payment
    select payment_id,count(*) as duplicate_count   
    from cleaned_payment
    group by payment_id
    having count(*) > 1;

   -- cleaned_order_details
    select order_detail_id,count(*) as duplicate_count   
    from cleaned_order_details
    group by order_detail_id
    having count(*) > 1; 

    --- cleaned_products
    select product_id,count(*) as duplicate_count       
    from cleaned_products   
    group by product_id
    having count(*) > 1;

   
-- Step 1: Rename the column and change its type to DATE
ALTER TABLE cleaned_products
    CHANGE COLUMN price price_date DATE;

-- Step 2: Update the rows that have default/zero dates
-- Note: MySQL DATE types store zeros as '0000-00-00', not 0.0
UPDATE cleaned_products 
SET price_date = '2023-04-07' 
WHERE price_date = '0000-00-00' OR price_date IS NULL;

-- Step 3: View your updated data
SELECT * FROM cleaned_products
WHERE price= '2023-04-07';



