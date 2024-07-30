use db_1;
select * from book1;
select distinct product_variant_id from book1;
select count(distinct product_variant_id) from book1;
-- Count the total no. of Unique products in these location on that date ?

select day, count(distinct product_variant_id) from book1 where Location in ("GGN - Sector 27","DEL-Vikaspuri","DEL - Kalkaji",
"DEL - Sector 10 Dwarka","DEL-Malviya Nagar") and day in ("12/1/2021","12/2/2021","12/3/2021","12/4/2021","12/5/2021")
group by day order by day asc;

-- Get the data of these location of these category name?
-- DEL-RAJOURI GARDEN	,Fruits & Vegetables
select product_variant_id from book1 where Location = "DEL-RAJOURI GARDEN" and category_name="Fruits & Vegetables";

USE DB_1;
select * FROM product;
SELECT * FROM SALES;
select product.Category, (product.Price * sales.Quantitiy) as sales  
from product join sales on product.ProductID=sales.ProductID;

-- Retrieve all products with their categories and prices.
select name,category, price from product;

-- Find the total sales quantity for each product.
select product.name, sum(sales.Quantitiy) as totalqty  
from product join sales on product.ProductID=sales.ProductID group by product.name order by product.name asc;

-- Find the total sales revenue for each product.
select product.name, sum((product.Price * sales.Quantitiy)) as sales  
from product join sales on product.ProductID=sales.ProductID group by product.name order by product.name asc;

-- List the products that have not been sold.
select * from product left join sales on product.ProductID=sales.ProductID where sales.SalesID is null;
insert into product value ("P031","Drinks","product31","Large",40);

-- Find the top 3 best-selling products by quantity.
select product.name, sum(sales.Quantitiy) as totalqty  
from product join sales on product.ProductID=sales.ProductID group by product.name order by product.name asc limit 3;

-- Calculate the average sales price per unit for each product.
select product.name, avg((product.Price * sales.Quantitiy)) as sales  
from product join sales on product.ProductID=sales.ProductID group by product.name order by product.name asc;

-- Retrieve the sales records for a specific month (e.g., January 2024).
select day(date) from sales;
alter table sales add column daten date;
select * from sales;
set sql_safe_updates=0;
delete from sales daten;
alter table sales drop column daten;
drop table sales;
select *  from sales where date="29-01-17";

-- Find the total revenue generated in a specific category.
select product.Category, sum((product.Price * sales.Quantitiy)) as totalsales
from product join sales on product.ProductID=sales.ProductID where category="Drinks"
group by product.Category;

-- List the products along with their total sales quantity and total revenue.
select product.name, sum(sales.Quantitiy) as totalquantity, sum((product.Price * sales.Quantitiy)) as totalrevenue
from product join sales on product.ProductID=sales.ProductID 
group by product.name;

-- Find the product with the highest total revenue.
select product.name, SUM((product.Price * sales.Quantitiy)) as revenue 
from product join sales on product.ProductID=sales.ProductID 
group by product.name order by revenue desc limit 1;



















