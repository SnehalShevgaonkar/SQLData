use sqlchallange;

-- 1.Orders per day: Find number of orders placed daily
select order_date,
count(order_id) as total_orders
from cleaned_orders
group by order_date
order by order_date;

-- 2.Orders per month: Find monthly order Trend
select month(order_date) as order_month,
monthname(order_date) as month_name,
count(order_id) as total_orders
from cleaned_orders
group by month(order_date), monthname(order_date)

-- 3.Highest order value:Find highest order value
select o.order_id,sum(p.payment_amount) as total_order_value
from cleaned_orders o
join cleaned_payment p
on o.order_id = p.order_id
group by o.order_id
order by total_order_value desc
limit 1;

-- 4.Lowest order value:Find lowest order value
select o.order_id,sum(p.payment_amount) as total_order_value
from cleaned_orders o
join cleaned_payment p
on o.order_id = p.order_id
group by o.order_id
order by total_order_value asc
limit 1 ;

-- 5.Avg.order size:Find average quantity per order
select avg(Order_quantity) as average_order_size
from (
select order_id, sum(quantity) as Order_quantity
from cleaned_order_details
group by order_id
)t;

-- 6.Order distribution:Catagorised order by quantity size (quantity<=2 small order,quantity <=5 medium order,else large order  )
 select case
 when quantity<=2 Then 'Small order'

 when quantity<=5 Then 'Medium order'

 Else 'Large order'
 End as order_type,
 count(*) as total_orders
 from cleaned_order_details
 group by order_type;

 -- 7.Peak sales day: find day with highest number of orders
 select
 order_date,count(order_id)as total_order
  from cleaned_orders
  group by order_date
  order by total_order desc
  limit 1;