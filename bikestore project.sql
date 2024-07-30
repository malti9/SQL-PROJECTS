rename table `bikestores.xlsx - data` to bikestore;

-- Write a query to select all columns for all bikes.
select * from bikestore;

--  Write a query to select all bikes that belong to the 'Mountain' category.
select * from bikestore where brand_name="trek";

-- Write a query to select all bikes and sort them by price in descending order.
select category_name , (revenue/total_units) as price from bikestore order by price desc;

-- Write a query to select the bike name, category, and price of all bikes.
select brand_name ,category_name, (revenue/total_units) as price from bikestore;

-- Write a query to select all bikes that are 'Trek' brand and have a price less than 1000.
select * from bikestore where brand_name = "Trek" and revenue< 1000;

-- Write a query to find the average price of bikes for each brand.
select brand_name , avg(revenue) as avg from bikestore group by brand_name;

-- Write a query to join the orders and customers tables and select the order ID, customer name, and order date.
select customers,order_id,order_date,state from bikestore;

 -- Write a query to find all bikes that have a price higher than the average price of all bikes.
select * from bikestore where revenue > (select avg(revenue) from bikestore);

-- Write a query to select the bike name, price, and the rank of each bike price within its category using a window function.

use db_1;
select * from bikestore;
SELECT brand_name, revenue, category_name,
    RANK() OVER (PARTITION BY category_name ORDER BY revenue) AS price_rank
FROM
    bikestore;

-- Write a query to find the total sales and the number of orders for each store, and display only those stores that have total sales greater than 5000.

select count(store_name) as countstore,store_name, sum(revenue) as total from bikestore 
group by store_name having total>5000;

-- Assuming a hierarchical structure in the categories table (where each category may have a parent category), write a query to find the entire hierarchy of a specific category starting from the top-most parent.



-- Write a query to find the bike with the highest price in each category.
select sum(revenue) as revenue ,brand_name, 
row_number() over (partition by category_name order by revenue desc) as category
from bikestore group by brand_name;













