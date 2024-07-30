- to create  a database
create database 11am;

-- to delete a database
drop database 11am;

-- to see all the database
show databases;

-- if u want to work on any database u need to use it
use 11am;

-- to create a table
create table student(roll int,name varchar(100),marks  int);
-- to see any table
select * from student;
-- to see description of a table
describe  student;

-- to make structural changes in existing table
-- to add a column
alter table student add column city varchar(100);
select * from student;
-- to add multiple column
alter table student add address varchar(100) after name,add phone char(10);
select * from student;

-- to change the position of existing column
alter table student modify column phone char(10) first,
modify city varchar(100) after name;
select * from student;

-- to delete a single column
alter table student drop column address;
select * from student;
alter table student drop column city,drop phone;

-- to change datatype of esisting column 
alter table student modify column roll varchar(100);

-- to rename a column
alter table student rename column roll to rollno;
select * from student;

select rollno,name from student;
select name from student;
-- to create  a database
create database 11am;

-- to delete a database
drop database 11am;

-- to see all the database
show databases;

-- if u want to work on any database u need to use it
use 11am;

-- to create a table
create table student(roll int,name varchar(100),marks  int);
-- to see any table
select * from student;
-- to see description of a table
describe  student;

-- to make structural changes in existing table
-- to add a column
alter table student add column city varchar(100);
select * from student;
-- to add multiple column
alter table student add address varchar(100) after name,add phone char(10);
select * from student;

-- to change the position of existing column
alter table student modify column phone char(10) first,
modify city varchar(100) after name;
select * from student;

-- to delete a single column
alter table student drop column address;
select * from student;
alter table student drop column city,drop phone;

-- to change datatype of esisting column 
alter table student modify column roll varchar(100);

-- to rename a column
alter table student rename column roll to rollno;
select * from student;

select rollno,name from student;
select name from student;
-- to create  a database
create database 11am;

-- to delete a database
drop database 11am;

-- to see all the database
show databases;

-- if u want to work on any database u need to use it
use 11am;

-- to create a table
create table student(roll int,name varchar(100),marks  int);
-- to see any table
select * from student;
-- to see description of a table
describe  student;

-- to make structural changes in existing table
-- to add a column
alter table student add column city varchar(100);
select * from student;
-- to add multiple column
alter table student add address varchar(100) after name,add phone char(10);
select * from student;

-- to change the position of existing column
alter table student modify column phone char(10) first,
modify city varchar(100) after name;
select * from student;

-- to delete a single column
alter table student drop column address;
select * from student;
alter table student drop column city,drop phone;

-- to change datatype of esisting column 
alter table student modify column roll varchar(100);

-- to rename a column
alter table student rename column roll to rollno;
select * from student;

select rollno,name from student;
select name from student;
show databases;
create database satsun;
use satsun;
create table student(roll int,name varchar(100));
select * from student;
insert into student(roll ,name) value(1,"rohit");
select * from student;
insert into student(roll ,name)
 value(2,"anjali"),
 (3,"satish"),
 (4,"aman"),
 (5,"pooja");
 select * from student;
 -- update,delete,rollback,commit
 select * from student;
 select name from student;
 select roll from student;
 select * from student where roll =5;
 select * from student where roll <5;
 -- update
 update student set name="aditi" where roll=5;
 set sql_safe_updates=0;
  update student set name="aditi" where roll=5;
  select * from student;
update student set name="pooja" where name="aman";
select * from student;
update student set name="rohit" limit 3;
select * from student;

-- to add a new column
alter table student add column city varchar(100);
select * from student;
update  student set city="delhi";
select * from student;
-- delete
delete from student limit 2;
select * from student;
delete from student where roll =4;
select * from student;

-- to change structure of a table always use alter command
alter table student drop column city;
select * from student;

-- to delete all the data keeping its structure safe
truncate table student;
select * from student;
use satsun;
create table employee(id int,name varchar(100),salary int);
select * from employee;
insert into employee value(1,"rohit",89000),(2,"aman",78000),(3,"pooja",56000);
select * from employee;
set sql_safe_updates=0;
update employee set name="palak" where id=1;
select * from employee;
rollback;
select * from employee;
set autocommit=0;
update employee set name="rohit" where id=1;
select * from employee;
rollback;
select * from employee;
insert into employee value(4,"komal",77000);
select * from employee;
rollback;
select * from employee;
delete from employee where id=1;
select * from employee;
rollback;
select * from employee;
delete from employee where id=1;
commit;
select * from employee;
rollback;
select * from employee;
insert into employee value(1,"rohit",89000);
select * from employee;
commit;
rollback;
select * from employee;
rollback;
select * from emp;
-- constraints
-- not null,default,check,unique
describe emp;
insert into emp value("tca1","satish",34000);
delete from emp where name="satish";
alter table emp modify empid varchar(100) unique;
insert into emp value("tca1","satish",34000);

create table data(roll int not null,name varchar(100),
age int check(age>7),city varchar(100) default "delhi");
select * from data;
insert into data(roll,name,age) value(1,"pooja",12);
select * from data;
insert into data(roll,name,age) value(2,"aman",6);
insert into data(name,age) value("aman",8);
insert into data(roll,name,age) value(2,"aman",8);
select * from data;
-- keys in mysql --- unique,primary key foreign key
use satsun;
create table parent(id int auto_increment ,name varchar(100),primary key(id));
select * from parent;
describe parent;
insert into parent(name) value("rohit"),("aman"),("pooja"),("neha"),("komal");
select * from parent;
create table child(fid int ,val int, foreign key(fid) references parent(id));
select * from child;
describe child;
insert into child(fid,val) value(1,103),(1,104),(2,405),(3,900),(3,999); 
select * from child;
insert into child(fid,val) value(6,103);
delete from parent where id=1;
update parent set id=7 where id=1;
drop table child;

create table child(fid int ,val int, 
foreign key(fid) 
references parent(id)
on delete cascade
on update cascade);
insert into child(fid,val) value(1,103),(1,104),(2,405),(3,900),(3,999); 
select * from child;

delete from parent where id=2;
select * from parent;
select * from child;
update parent set id=7 where id=1;
select * from parent;
select * from child;

drop table child;
create table child(fid int ,val int, 
foreign key(fid) 
references parent(id)
on delete set null
on update cascade);
insert into child(fid,val) value(7,103),(5,104),(4,900),(3,999); 
select * from child;
delete from parent where id=7;
select * from parent;
select * from child;
update parent set id=6 where id=3;
select * from parent;
select * from child;
update parent set id=9 where name="pooja";
-- text functions
create table names(fname varchar(100),lname varchar(100));
insert into names values("rohit","singh"),("satish","singh"),
("aman","kumar"),("amit","chuahan"),("nikhil","tanwar");
select * from names;
select *,concat(fname,lname)as fullname from names;
select *,concat(fname," ",lname) fullname from names;
select *,concat(fname," ",lname," ","abc") from names;
select *,concat_ws(" ",fname,lname,"abc","123") as fullname from names;
select *,upper(fname) as upper from names;
select *,lower(upper(fname)) as lower from names;
select *,left(fname,1) as first_letter from names;
select *,upper(left(fname,1)) as first_letter from names;
select *,upper(left(fname,1)) as first_letter,length(fname) as len from names;
select *,right(fname,4) from names;
select *,upper(left(fname,1)) as first_letter,right(fname,length(fname)-1) from names;
select *,concat(upper(left(fname,1)),right(fname,length(fname)-1))as propercase from names;
select * ,insert(fname,2,3,"hello") from names;
select *,insert(fname,2,0,"hello") from names;
select *,substr(fname,2,3) from names;
select *,replace(fname,"rohit","aman") from names;
create table fullname(fname varchar(100));
insert into fullname values("rohit singh"),("nirbhay rathore"),("aman rout"),("naina thakur");
select * from fullname;
select *,substring_index(fname," ",1) as firstname from fullname;
select *,substring_index(fname," ",-1) as lastname from fullname;
select *,repeat(concat(fname," "),2) from fullname;
select *,reverse(fname) as reverse from fullname;
SELECT  *,LOCATE(" ", fname) from fullname;
SELECT LTRIM('  barbar');
SELECT RTRIM('  barbar    ');
create table p(id int auto_increment ,name varchar(100),primary key(id)) auto_increment=100;
insert into p(name) value("rohit"),("anushka"),("pooja");
-- date  and time 
use satsun;
create table dates(name varchar(100),doj date);
select * from dates;
insert into dates values("rohit","2019-7-13"),("aman","2020-5-6"),("nirbhay","2021-5-12");
select * from dates;
alter table dates add column today date;
select * from dates;
select current_date();
select curdate();
set sql_safe_updates=0;
update dates set today=curdate();
select * from dates;
select *,day(doj)as day,month(doj) month,year(doj) as year from dates;
select *,extract(day from doj) from dates;
select *,extract(month from doj) from dates;
select *,day(doj)as day,month(doj) month,year(doj) as year,
dayname(doj) as dayname ,dayofmonth(doj),dayofweek(doj),dayofyear(doj) 
 from dates;
select *,day(doj)as day,month(doj) month,year(doj) as year,monthname(doj) from dates;
select *,day(doj)as day,month(doj) month,year(doj) as year,yearweek(doj) ,week(doj) from dates;
select * from dates;
select *,adddate(doj,interval 5 day) from dates;
select *,adddate(doj,interval 5 month) from dates;
select *,subdate(doj,interval 5 year) from dates;
select *,today-doj from dates;
select*,datediff(today,doj) from dates;
select*,round(datediff(today,doj)/365,0) as yeardiff from dates;
select *,date_format(doj,"%d-%m-%y") from dates;
select *,date_format(doj,"%d-%m-%Y") from dates;
select *,date_format(doj,"%d-%M-%Y") from dates;
select *,date_format(doj,"%d-%m-%Y,%W") from dates;

-- time
create table times(name varchar(100) ,ot time);
select * from times;
insert into times values("rohit","10:00:00"),("palak","9:30:00");
select * from times;
select sysdate();
select current_time();
select curtime();
select date(sysdate());
select time(sysdate());
select * ,hour(ot),minute(ot),second(ot) from times;
select * ,addtime(ot,"8") from times;
select * ,addtime(ot,"0:5:0") from times;
select * ,addtime(ot,"8:30") from times;

use satsun;
select * ,subtime(ot,"0:30") from times;
alter table times add column now time;
select * from times;
set sql_safe_updates=0;
update times set now=curtime();
select * from times;
select *,timediff(now,ot)  diff from times;
select *,time_format(ot,"%h:%i:%s %p") from times;
select *,time_format(ot,"%r") from times;

-- joins
select * from record;
select roll no from record;
select * from trainer;
select * from record;
-- find all the student record with the trainer assigned to them
-- inner join
select * from record inner join trainer on record.tid= trainer.tid;
select * from record join trainer on record.tid= trainer.tid;
select * from record r join trainer t on r.tid= t.tid;

insert into record values (11,"nikhil",107);
select * from record;
-- find aLL THE students name whether their trainer  is assigned or not
-- left join
select * from record r left join trainer t on r.tid= t.tid;
select * from record r left outer join trainer t on r.tid= t.tid;

-- find all the trainer name along with student whether assigned or not
-- right join
select * from record r right join trainer t on r.tid= t.tid;
select * from record r right outer join trainer t on r.tid= t.tid;

-- cross join 
select * from record cross join trainer;
select * from course;

-- to combine three tables
select record.roll no,record.name,record.tid,trainer.trainer_name,course.cname
 from record  inner join trainer on record.tid=trainer.tid inner join course on course.tid=trainer.tid;
 select record.roll no,record.name,record.tid,trainer.trainer_name,course.cname
 from record  inner join trainer on record.tid=trainer.tid inner join course on course.tid=trainer.tid;
 
 use satsun;

create table employees(empid int,empname varchar(100),supid int);
select * from employees;
insert into employees values(1,"rohit",2),(2,"pooja",4),(3,"komal",2),(4,"neha",3),(5,"aman",3);
select * from employees;

-- self join
select e.empname as "employeename",s.empname as "supervisorname" from employees e 
inner join employees s on s.empid=e.supid;

select * from record;
select * from trainer;
alter table record add column trainer varchar(100);
select * from record;

set sql_safe_updates=0;
update record inner join trainer on record.tid=trainer.tid set record.trainer=trainer.trainer_name; -- to update data in a column with difference values from diff tabel
select * from record;

-- set operator
select * from record;
select * from trainer;
insert into trainer values(108,"sneha");
select * from trainer;

-- union it appends  data in one column and data don't repeat
select name from record union select trainer_name from trainer;

-- union all to get duplicate dataset
select name from record union all select trainer_name from trainer;

-- find the common name b/w trainer and record
select * from trainer;
-- subquery
-- intersection
select name from record where name in (select trainer_name from trainer);

-- minus
select name from record where name not in (select trainer_name from trainer);

select trainer_name from trainer where trainer_name in (select name from record);
select trainer_name from trainer where trainer_name not in (select name from record);

-- symmetric difference
select name from record where name not in (select trainer_name from trainer) union
select trainer_name from trainer where trainer_name not in (select name from record);

select * from cars;

-- aggregate functions
use satsun;
select * from cars;
select count(cars) from cars;
select distinct cars from cars; -- distinct show unique values from a column
select cars,count(*) from cars group by cars;
select cars,count(*)  as counts from cars group by cars having counts>4;
select region,count(*)  as counts from cars group by region;
select sum(sales) from cars;
select cars,sum(sales) from cars group by cars;
select Region,sum(sales) as sales from cars group by region having sales>8000;
select cars,region,count(*) from cars group by cars,region;
select cars,region,sum(sales) from cars group by cars,region;
select cars,avg(sales) from cars group by cars;
select region,avg(sales) from cars group by region;
select region,min(sales) from cars group by region;
select region,max(sales) from cars group by region;

-- order by (sorting)
select * from sales;
select * from sales order by name;
select * from sales order by name asc;
select * from sales order by name desc;
select * from sales order by sales desc;
select * from sales order by sales asc;
select * from sales order by sales desc;
select * from sales order by sales desc limit 3;
select * from sales order by sales desc limit 2;
select * from sales order by sales desc limit 2,3;

-- rank,dense_rank,row_number
select *,rank() over(order by sales desc) as ranking from sales;
select *,dense_rank() over(order by sales desc) as dense_ranking from sales;
select *,row_number() over(order by sales desc) as rownum from sales;

select *,rank() over(order by sales desc) as ranking from sales where ranking <6;

-- virtual table
use satsun;
select *,rank() over(order by sales desc) as ranking from sales where ranking <6;
show tables;
with newsales as
(
select *,rank() over(order by sales desc) as ranking from sales
)
select * from newsales where ranking<6;

with newsales as
(
select *,dense_rank() over(order by sales desc) as ranks from sales
)
select * from newsales where ranks=2;

with newsales as
(
select *,row_number() over(order by sales desc) as r from sales
)
select * from newsales where r between 2 and 5;

create table dup (id int primary key ,name varchar(100),phone char(10));
alter table dup modify column id int  auto_increment;
insert into dup(name,phone) values("rohit","7033132638"),("aman","9067854321"),
("rohit","8287653132"),("rohit","7033132638"),("aman","9067854321");
select * from dup;

select name,phone,count(*) from dup group by name,phone;
select name,phone,count(*) as c from dup group by name,phone having c>1 ;
set sql_safe_updates=0;
delete d1 from dup d1 inner join dup d2 where d1.id<d2.id and d1.name=d2.name and d1.phone=d2.phone;

select * from dup;

-- views
-- syntax
-- create view view_name as select * from table_name;
select * from record;
create view new as select name,trainer from record;
select * from new;
set sql_safe_updates=0;
update new set name="satish" where name="sneha";
select * from new;
select * from record;
update record set name="sneha" where name="satish";
select * from new;
select * from record;

-- grant and revoke

-- grant
use satsun;
select * from fullname;
grant select on fullname to "weekend";
grant select,insert on fullname to "weekend";
grant select,insert,delete on fullname to "weekend";

-- revoke
revoke select on fullname from "weekend";
revoke insert,delete on fullname from "weekend";

-- stored procedure
use satsun;
select * from fullname;
insert into fullname values("satish singh");
select * from fullname;
set sql_safe_updates=0;
delete from fullname where fname ="satish singh";
select * from fullname;
select * from fullname;
insert into fullname values("satish singh");

- stored procedure
create database sp1;
use sp1;

create table employee(id int,name varchar(100),salary int);
select * from employee;
insert into employee value(1,"rohit",89000),(2,"aman",78000),(3,"pooja",56000);
select * from employee;
insert into employee value(4,"satish",49000);
select * from employee;

-- to use a existing procedure
-- call procedure_name();
call get_data;
call conditional;
call input(50000);
CALL COUNTS(@C);
SELECT @C AS TOTALCOUNT;
CALL TABLE1;

-- TRIGGERS
CREATE TABLE employeeS
( 
name varchar(45) NOT NULL, 
occupation varchar(35) NOT NULL, 
working_date date, 
working_hours varchar(10) 
); 
INSERT INTO employees VALUES
('Robin', 'Scientist', '2020-10-04', 12),
('Warner', 'Engineer', '2020-10-04', 10),
('Peter', 'Actor', '2020-10-04', 13),
('Marco', 'Doctor', '2020-10-04', 14),
('Brayden', 'Teacher', '2020-10-04', 12),
('Antonio', 'Business', '2020-10-04', 11);

select * from employees;

-- DELIMITER //
-- Create Trigger before_insert_empworkinghours
-- BEFORE INSERT ON employees FOR EACH ROW
-- BEGIN
-- IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
-- END IF;
-- END //

INSERT INTO employees VALUES('aman', 'Scientist', '2020-10-04', -12);
select * from employees;
INSERT INTO employees VALUES('satish', 'Scientist', '2023-10-04', -2);
select * from employees;
INSERT INTO employees VALUES('aman', 'Scientist', '2020-10-04', 2);
select * from employees;


create table medicine(mid int, medname varchar(50),price float, qty int);
insert into medicine values
 (1,"Crocin",300.50,22),
(2,"Seridon",450.45,40);
select * from medicine;


create table neworder(mid int,odate date, newqty int);
select * from neworder;

-- trigger

-- delimiter $$
-- create trigger neworderformedicine
-- AFTER update on medicine
-- FOR EACH Row
-- BEGIN
-- IF NEW.qty<10 Then INSERT into neworder values(NEW.mid, sysdate(),200);
-- END IF;
-- END;
-- $$

set sql_safe_updates=0;
update medicine set qty=9 where mid=1;
select * from medicine;
select * from neworder;
use 10am;
select * from fullname;
update fullname set name="satish singh" where name="rohit singh";
select * from fullname;

