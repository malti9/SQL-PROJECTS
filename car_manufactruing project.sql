use db_1;

-- What's the most popular car manufacturer?
select cars,count(cars) as counts from cars group by cars order by counts desc;

-- What's the most popular manufacturing country (Refer to "Manufacturing country" sheet)?
create table manufacturing_country (company varchar(50) , country varchar (50));
insert into manufacturing_country values ("BMW ","GERMANY"),("AUDI","GERMANY"),("TESLA","USA"),("JAGUAR","UK"),("Mercedes","GERMANY"),
("Cadillac","USA"),("Lexus","JAPAN"),("VOLVO","Sweden");
SELECT * FROM manufacturing_country;
select * from cars;
SELECT manufacturing_country.COUNTRY,CARS.cars,COUNT(CARS.cars) FROM manufacturing_country 
JOIN CARS ON manufacturing_country.COMPANY=CARS.CARS group by CARS.cars,manufacturing_country.COUNTRY;
SELECT COMPANY FROM manufacturing_country union SELECT CARS FROM CARS;
SELECT COMPANY FROM manufacturing_country union ALL SELECT CARS FROM CARS;

-- What's the least popular color for cars?
SELECT COLOR,COUNT(COLOR) AS COUNTS FROM CARS group by COLOR ORDER BY COUNTS ASC;

-- What's the average price per owner?
select OWNER ,AVG(PRICE) FROM carS group by OWNER;











