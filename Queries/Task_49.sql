use sqlchallange;

-- 1.Top 5 customer revenue using CTE

with customer_revenue as(
    
    select c.customer_id,c.customerr_name,sum(p.payment_amount)as total_revenue
    from cleaned_customers c
    join cleaned_orders o on c.customer_id=o.customer_id
    join cleaned_payment p on o.order_id=p.order_id
    group by c.customer_id,c.customerr_name

)
select * from customer_revenue
order by total_revenue desc
limit 5;


-- 2.Top 5 product using CTE
with product_sales As(
    select p.product_id,
    p.product_name,
    sum(od.quantity)as total_quantity
    from cleaned_products p
    join cleaned_order_details od on p.product_id=od.product_id
    group by p.product_id,p.product_name
)
select * from product_sales
order by total_quantity desc
limit 5;


-- 3.Rank Customers by revenue
select c.customer_id,c.customerr_name,
sum(p.payment_amount)as total_revenue,
rank() over(order by sum(p.payment_amount) desc) as revenue_rank
from cleaned_customers c
join cleaned_orders o on c.customer_id=o.customer_id
join cleaned_payment p on o.order_id=p.order_id
group by c.customer_id,c.customerr_name
order by revenue_rank;    

-- 4.Rank products by quantity sole
select p.product_name,
sum(od.quantity)as total_quantity,
rank() over(order by sum(od.quantity) desc) as quantity_rank    
from cleaned_products p
join cleaned_order_details od on p.product_id=od.product_id
group by p.product_name
order by quantity_rank;

-- 5.Revenue per category using CTE
with category_revenue as(
    select p.category
    
, sum(od.quantity*p.price)as total_revenue
    from cleaned_products p
    join cleaned_order_details od on p.product_id=od.product_id
    group by p.category
)
select * from category_revenue
order by total_revenue desc;    

-- 6.Revenue comparision with case
 select 
 o.customer_id,
 sum(p.payment_amount)as total_revenue,
    case 
    when sum(p.payment_amount)>1000 then 'High Revenue'
    when sum(p.payment_amount) between 500 and 1000 then 'Medium Revenue'
    else 'Low Revenue'
    end as revenue_category
    from cleaned_orders o
    join cleaned_payment p on o.order_id=p.order_id
    group by o.customer_id;

-- 7.Stored procedure customer revenue report
create procedure customer_revenue_report()
begin
    select c.customer_id,c.customerr_name,sum(p.payment_amount)as total_revenue
    from cleaned_customers c
    join cleaned_orders o on c.customer_id=o.customer_id
    join cleaned_payment p on o.order_id=p.order_id
    group by c.customer_id,c.customerr_name
    order by total_revenue desc;
end;

call customer_revenue_report();