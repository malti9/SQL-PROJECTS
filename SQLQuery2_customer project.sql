use db4
create table customers (customer_id	int ,first_name	varchar(50), last_name varchar(50),	age	int , country varchar (50))
insert into customers values (1	,'John','	Doe	',31,'	USA'), (2, 'David','Robinson' , 22 ,'UK'),
 (3, 'Robert','rawat' , 21 ,'hyd'),
 (4, 'Luna','sing' , 31 ,'pnb'),
 (5, 'Betty','Doe' , 28 ,'mum')


Create table orders (order_id int, 	item varchar(50),	amount	money ,customer_id int)
INSERT INTO orders   VALUES
(1, 'Keyboard', 400, 4),
(2, 'Mouse', 300, 4),
(3, 'Monitor', 12000, 3),
(4, 'Keyboard', 400, 1),
(5, 'Mousepad', 250, 2);

Create table  Shippings (shipping_id int,status varchar(50),customer varchar(50))
INSERT INTO  Shippings VALUES
(1, 'Pending', 2),
(2, 'Pending', 4),
(3, 'Delivered', 3),
(4, 'Pending', 5),
(5, 'Delivered', 1);

--List all customers who have placed an order. 
SELECT  * FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;


--Find the total number of orders placed by each customer.
select * from  customers
select * from  orders
select * from   Shippings

select customers.customer_id,COUNT(orders.order_id) as totalorders from orders join customers on customers.customer_id=orders.order_id
group by customers.customer_id

--Retrieve orders along with their shipping details. 
select * from Shippings join orders on shippings.customer=orders.customer_id

select orders.order_id,orders.item ,shippings.shipping_id
from Shippings join orders on shippings.customer=orders.customer_id

--List all customers who have not placed an order. 
SELECT  * FROM customers
left JOIN orders ON customers.customer_id = orders.customer_id
where orders.customer_id is null

--Calculate the total sales amount for each shipping method.
select shippings.status ,sum(orders.amount) as totalamount 
from Shippings join orders on shippings.customer=orders.customer_id group by shippings.status

--Get the details of the most recent order for each customer.

--List all orders that were shipped after the order date. 

--Find the average order amount for each customer. 
SELECT customers.customer_id,  avg(orders.amount)  as avgorder FROM customers
JOIN orders ON customers.customer_id = orders.customer_id group by  customers.customer_id

--Retrieve the details of orders that have not been shipped yet