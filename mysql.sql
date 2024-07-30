USE 11AM;
create table cricket (cricket_id int auto_increment , name varchar(50),primary key(cricket_id)) auto_increment =101;
create table football (football_id int auto_increment , name varchar(50),primary key(football_id)) auto_increment =101;
alter table cricket modify column cricket_id int auto_increment;
insert into cricket (name) values ("kohali"),("suresh"),("rohit"),("hardik"),("ms dhoni"),("kl rahul");
select * from cricket;
insert into football(name) values ("stuart"),("masi"),("ronaldo"),("hardi");
select * from football;
select * from cricket;
insert into football (name) values("suri"),("james"),("shakira");
select * from football;
select * from cricket;
select * from football inner join cricket on football.name=cricket.name;
use 11am;
drop table employees;
create table employees (empid int, ename varchar(100), supid int);
select * from employees;
insert into employees values (1,"aman",),(2,"pooja",3),(3,"komal",3),(4,"neha",5),(5,"rohit",4);
select * from employees;
insert into employees values(6,"rakesh",2),(7,"varma",3);
select * from employees;
select e.ename as "employeesename",s.ename as "supervisorname" from employees;
drop table employees;
create table employees(empid int,empname varchar(100),supid int);
select * from employees;
insert into employees values(1,"rohit",2),(2,"pooja",4),(3,"komal",2),(4,"neha",3),(5,"aman",3);
select * from employees;
select e.empname as "employeename",s.empname as "supervisorname" from employees e 
inner join employees s on s.empid=e.supid;
select * from record;
select * from trainer;
alter table record add column trainer varchar (100);
set sql_safe_updates=0;
update record inner join trainer on record.tid=trainer.tid set record.trainer =trainer.trainer_name;
select * from record;
-- aggregate functions
use 11am;
select * from `car data`;
alter table `car data` rename cars;
select * from cars;
alter table cars add column region varchar(50);
select * from cars;
alter table cars drop column region;
select * from cars;
select sum(selling_price) from cars;
select count(selling_price) from cars
select distinct car_name from cars;
select car_name,count(*) from cars group by car_name;
select distinct car_name from cars;
select distinct year from cars;
select car_name ,sum(selling_price) from cars group by car_name;
select car_name ,sum(selling_price) from cars group by car_name having selling_price>30000;
select * from cars where car_name in ("audi","swift","toyota");
select car_name ,count(*) from cars group by car_name having counts>4;
select year,count(*) from cars group by year;
select sum(selling_price) from cars;
select car_name from cars where car_name="audi";
select car_name from cars where car_name="toyota";
select year,car_name ,count(*) from cars group by car_name ,year












