use sqlchallange;
-- Basic Analysis
-- 1.Displays total customers from cleaned_customers
select count(*) as total_customers
 from cleaned_customers;  

-- 2.Displays Total orders from cleaned_orders
;

-- 3. Displays total revenues from cleaned_payments

select sum(payment_amount) as total_revenue
 from cleaned_payment;

 -- 4.Displays Avg ordervalue from cleaned_paymens
select avg(payment_amount) as avg_order_value
    from cleaned_payment;

-- 5.Dispalys total product sold from cleaned_irder_details
select sum(quantity) as total_products_sold
 from cleaned_order_details;

-- 6.Displays orders per customer from clened_orders
select customer_id, count(*) as orders_per_customer
 from cleaned_orders
 
 group by customer_id
 order by orders_per_customer desc;

