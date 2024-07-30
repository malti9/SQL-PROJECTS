create database pizzahut;
use pizzahut;
select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;
select count("order_id") from order_details;

-- Retrieve the total number of orders placed.
select count("order_id") as total_orders from orders;
-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- Identify the highest-priced pizza.
select pizzas.price,pizza_types.name from pizza_types 
join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id 
order by pizzas.price desc limit 1;
-- Identify the most common pizza size ordered.
select pizzas.size, count(order_details.order_details_id ) 
from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id 
group by pizzas.size order by count(order_details.order_details_id ) 
desc limit 1 ;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name ,sum(order_details.quantity) as qtycount from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details 
on order_details.pizza_id=pizzas.pizza_id group by pizza_types.name order by qtycount desc limit 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, sum(order_details.quantity) quantity from pizzas join order_details on pizzas.pizza_id=order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id =pizzas.pizza_type_id group by pizza_types.category;

-- Determine the distribution of orders by hour of the day.
select count(order_id) as order_count, hour(time) as order_time from orders group by hour(time);

-- Join relevant tables to find the category-wise distribution of pizzas.
select category,count(pizza_type_id) from pizza_types group by category;
 
-- Group the orders by date and calculate the average number of pizzas ordered per day.
select avg(quantity) from (select orders.date , sum(order_details.quantity) as quantity from orders 
join order_details on orders.order_id=order_details.order_id 
group by orders.date) as order_qty_per_day;

-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name,sum(pizzas.price * order_details.quantity) as revenue from pizzas join order_details 
on pizzas.pizza_id =order_details.pizza_id join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name
order by revenue desc limit 3;

-- Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.category,sum(pizzas.price * order_details.quantity)/ (select sum(order_details.quantity*pizzas.price) from order_details join pizzas 
on order_details.pizza_id=pizzas.pizza_id )*100 as revenue from pizzas join order_details 
on pizzas.pizza_id =order_details.pizza_id join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category order by revenue desc;

-- Analyze the cumulative revenue generated over time.
use pizzahut;
select date ,sum(revenue) over(order by date) as cum_revenue from 
(select orders.date, sum(order_details.quantity*pizzas.price) as revenue from order_details 
join pizzas on order_details.pizza_id=pizzas.pizza_id 
join orders on orders.order_id = order_details.order_id group by orders.date) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name,revenue,category from
(select category,name,revenue, rank() over(partition by category order by revenue desc) as rn 
from 
(select pizza_types.category,pizza_types.name, sum(order_details.quantity*pizzas.price) as revenue from pizzas 
join order_details on pizzas.pizza_id=order_details.pizza_id
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id group by pizza_types.category,pizza_types.name) as a) as b
where rn<=3;











