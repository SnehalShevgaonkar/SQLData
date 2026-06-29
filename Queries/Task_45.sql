use sqlchallange;

-- Joins
-- 1.Top customers by orders:find customers who placed most orders

select c.customer_id ,c.customerr_name,count(o.order_id) as total_orders
from cleaned_customers c
join cleaned_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customerr_name
order by total_orders desc

-- 2.Top customers by revenue: find customers who generated the most revenue

select c.customer_id, c.customerr_name, sum(p.payment_amount) as total_revenue
from cleaned_customers c
join cleaned_orders o on c.customer_id = o.customer_id
join cleaned_payment p on o.order_id = p.order_id

group by c.customer_id, c.customerr_name
order by total_revenue desc

-- 3.Cutomers with no orders: find customers who have not placed any orders
select c.customer_id, c.customerr_name
from cleaned_customers c
left join cleaned_orders o on c.customer_id = o.customer_id
where o.order_id is null

-- 4.New customer Trend:find the customers signed up trend monthwise
select month(signup_date) as month_number,
monthname(signup_date) as month_name,
count(customer_id) as total_customers
from cleaned_customers
group by month(signup_date), monthname(signup_date)

-- 5 Repeat customers:find customer with multiple orders
select c.customer_id, c.customerr_name, count(o.order_id) as total_orders   
from cleaned_customers c
join cleaned_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customerr_name
having count(o.order_id) > 1

-- 6.customer lifetime value:find total spending of each customer

select c.customer_id, c.customerr_name, sum(p.payment_amount) as total_spending
from cleaned_customers c
join cleaned_orders o on c.customer_id = o.customer_id

join cleaned_payment p on o.order_id = p.order_id
group by c.customer_id, c.customerr_name
order by total_spending desc

-- 7.Avg spend per customer:find average spending by each customer
select c.customer_id, c.customerr_name, avg(p.payment_amount) as avg_spending
from cleaned_customers c
join cleaned_orders o on c.customer_id = o.customer_id
join cleaned_payment p on o.order_id = p.order_id   
group by c.customer_id, c.customerr_name
order by avg_spending desc

-- 8.Customer per city:Find no. of customer in each city
select city, count(customer_id) as total_customers
from cleaned_customers
group by city
order by total_customers desc