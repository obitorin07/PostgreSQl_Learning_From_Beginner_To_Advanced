create database training;

CREATE TABLE employee(
first_name varchar(20),
mid_name varchar(20),
last_name varchar(20),
age int,
salary int,
location varchar(20)
);

select * from employee;

--this one used when we have all data to enter
insert into employee values ('Naruto','Minato','Usumaki/Namikaze',15,15000,'Konaha');

select first_name,age,salary from employee;

select * from employee;

-- it will add these data and this person dont have middle name
-- so we use like this to insert data and this one is used when we have limited data of the user

insert into employee (first_name,last_name,age,location,salary) values(
'Obito','Uchiha',21,'Red Moon',21000);

insert into employee (first_name,location,last_name,salary,age) values(
'Hinata','Japan','Hyuga',15000,18);

insert into employee(first_name,mid_name,last_name,age,location)values('Kushina','Minato','Namikaze/Usumaki',30,'Hidden Leaf');

-- it will print who have Minato Named Middle name they will be printed
select *  from employee where mid_name='Minato';

select * from employee where last_name ='' order by first_name;

insert into employee(first_name,mid_name,last_name,age,location,salary)values('Konahamaro','Minato','sarutobi',10,'Hidden Leaf',15000);

select * from employee;

-- it will display who have less than age 26  
select first_name ,last_name from employee where age <26;


-- droping table 

drop table employee;


-- creating table with proper way
CREATE TABLE employee(
first_name varchar(20) not null,
mid_name varchar(20),
last_name varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null
);


select * from employee;

insert into employee values ('Naruto','Minato','Usumaki/Namikaze',15,15000,'Konaha');

insert into employee values('Obito',null,'Uchiha',18,10000,'Red Moon');

insert into employee (first_name,location,last_name,salary,age) values(
'Hinata','Japan','Hyuga',15000,18);

-- this statement will send an error because required data not null
-- insert into employee(first_name,mid_name,last_name,age,location)values('Kushina','Minato','Namikaze/Usumaki',30,'Hidden Leaf');

insert into employee (first_name,location,last_name,salary,age) values(
'Hinata','Japan','Hyuga',15000,18);

insert into employee(first_name,mid_name,last_name,age,location,salary)values('Kushina','Minato','Namikaze/Usumaki',30,'Hidden Leaf',15000);

insert into employee(first_name,mid_name,last_name,age,location,salary)values('Konahamaro',not null,'sarutobi',10,'Hidden Leaf',15000);


-- droping table again

drop table employee;
-- check table still exist or not 

select * from employee;


-- creating table with default 
CREATE TABLE employee(
first_name varchar(20) not null,
mid_name varchar(20),
last_name varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default 'Hidden Leaf'
);


insert into employee values ('Naruto','Minato','Usumaki/Namikaze',15,15000);
-- "Naruto"	"Minato"	"Usumaki/Namikaze"	15	15000	"Hidden Leaf"
-- it add default value in place

insert into employee values('Obito',null,'Uchiha',18,10000,'Red Moon');
-- here we explicitly given location name so it will print Red Moon

insert into employee (first_name,last_name,salary,age) values(
'Hinata','Hyuga',15000,18);
-- it add default value in place


insert into employee(first_name,mid_name,last_name,age,salary)values('Kushina','Minato','Namikaze/Usumaki',30,15000);

insert into employee(first_name,mid_name,last_name,age,salary)values('Konahamaro', null,'sarutobi',10,15000);

select * from employee;

select * from employee where location ='Hidden Leaf' order by age;
-- it will print asc order by age

select * from employee where location ='Hidden Leaf' order by first_name;
-- same here but little different it will alphabetic asc order