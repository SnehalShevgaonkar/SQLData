use sqlchallange;
-- 1.To change date format  dd-mm-yyyy to yyyy-mm-dd
update cleaned_customers
set signup_date=
concat(RIGHT(signup_date,4),'-',substring(signup_date,4,2),'-',LEFT(signup_date,2))
where signup_date like '__-__-____';


UPDATE cleaned_customers
SET signup_date = CASE 
    -- DD-MM-YYYY (If the first part is greater than 12, it must be the day)
    WHEN CAST(SUBSTRING(signup_date, 1, LOCATE('-', signup_date) - 1) AS UNSIGNED) > 12 
        THEN DATE_FORMAT(STR_TO_DATE(signup_date, '%d-%m-%Y'), '%Y-%m-%d') 
    
    -- MM-DD-YYYY (If the first part is 12 or less, assume it is the month)
    WHEN CAST(SUBSTRING(signup_date, 1, LOCATE('-', signup_date) - 1) AS UNSIGNED) <= 12 
        THEN DATE_FORMAT(STR_TO_DATE(signup_date, '%m-%d-%Y'), '%Y-%m-%d') 
    
    ELSE signup_date 
END;
   
   UPDATE cleaned_customers
SET signup_date = DATE_FORMAT(
    STR_TO_DATE(signup_date, '%d-%m-%Y'), '%Y-%m-%d'
);
 -- 2.remove invalid date
update cleaned_customers
set signup_date=null
where
cast(right(signup_date,2)As unsigned)>31;

select distinct signup_date
from cleaned_customers



-- For Orders table

update cleaned_orders
set order_date=
concat(RIGHT(order_date,4),'-',substring(order_date,4,2),'-',LEFT(order_date,2))
where order_date like '__-__-____';

UPDATE cleaned_orders
SET order_date = CASE 
    -- DD-MM-YYYY (If the first part is greater than 12, it must be the day)
    WHEN CAST(SUBSTRING(order_date, 1, LOCATE('-', order_date) - 1) AS UNSIGNED) > 12 
        THEN DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m-%d') 
    
    -- MM-DD-YYYY (If the first part is 12 or less, assume it is the month)
    WHEN CAST(SUBSTRING(order_date, 1, LOCATE('-', order_date) - 1) AS UNSIGNED) <= 12 
        THEN DATE_FORMAT(STR_TO_DATE(order_date, '%m-%d-%Y'), '%Y-%m-%d') 
    
    ELSE order_date 
END;


 -- 2.remove invalid date
update cleaned_orders
set order_date=null
where
cast(right(order_date,2)As unsigned)>31;


-- For Cleaned_Payment table
-- 1.To change date format  dd-mm-yyyy to yyyy-mm-dd
update cleaned_payment
set payment_date=
concat(RIGHT(payment_date,4),'-',substring(payment_date,4,2),'-',LEFT(payment_date,2))
where payment_date like '__-__-____';

UPDATE cleaned_payment
SET payment_date = CASE 
    -- DD-MM-YYYY (If the first part is greater than 12, it must be the day)
    WHEN CAST(SUBSTRING(payment_date, 1, LOCATE('-', payment_date) - 1) AS UNSIGNED) > 12 
        THEN DATE_FORMAT(STR_TO_DATE(payment_date, '%d-%m-%Y'), '%Y-%m-%d') 
    
    -- MM-DD-YYYY (If the first part is 12 or less, assume it is the month)
    WHEN CAST(SUBSTRING(payment_date, 1, LOCATE('-', payment_date) - 1) AS UNSIGNED) <= 12 
        THEN DATE_FORMAT(STR_TO_DATE(payment_date, '%m-%d-%Y'), '%Y-%m-%d') 
    
    ELSE payment_date 
END;
   
   UPDATE cleaned_payment
SET payment_date = DATE_FORMAT(
    STR_TO_DATE(payment_date, '%d-%m-%Y'), '%Y-%m-%d'
);

-- 2.remove invalid date
update cleaned_payment
set payment_date=null
where
cast(right(payment_date,2)As unsigned)>31;

select distinct payment_date
from cleaned_payment



-- CHANGING DATA TYPES
   -- Converting data type of cleaned_customers
    alter table cleaned_customers
    modify customer_id int, 
    modify customerr_name varchar(25), 
    modify city  varchar(25),
    modify signup_date date;   

    --- Converting data type of cleaned_orders
    alter table cleaned_orders
    modify order_id int, 
    modify customer_id int,
    modify order_date date;
  
  -- Converting data type of cleaned_products
    alter table cleaned_products
    modify product_id int, 
    modify product_name varchar(25),
    modify price  date;

    --- Converting data type of cleaned_payment
    alter table cleaned_payment
        modify payment_id int,
        modify order_id int,
        modify payment_amount decimal(10,2),
        modify payment_date date;
    --- Converting data type of cleaned_order_details
    alter table cleaned_order_details  
      
