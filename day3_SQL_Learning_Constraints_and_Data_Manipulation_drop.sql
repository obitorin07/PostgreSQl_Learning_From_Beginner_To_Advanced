-- Day3 sql learning

select * from employee;

-- adding multiple values
insert into employee (first_name,last_name,age,salary) values('Sakshi','Patil',25,15000),('Ramesh','Chadda',28,18000);

create table student (
student_id serial,
student_name varchar(20),
student_age int );

drop table student;

create table student (
student_id int primary key not null,
student_name varchar(20) not null,
student_age int not null,
course_fee int default 2499,
course_name varchar (40) default 'Data Analytics'
);

select * from student;

insert into student (student_name,student_id,student_age)values('Thomas Shleby',1001,25),('Grace Shelby',1002,23);

-- it will show an error because primary key cannot allow duplication
insert into student values(1001,'Muskan Mulla',24,2500);

insert into student values(1003,'Muskan Mulla',24,2500);

insert into student values(1004,'Dinesh Kartik',24, null,'Data Analytics Using Python');

update student set course_fee =2499 where student_id =1004;

-- here it added same name so if we want to those also unique we do like this lets see 
-- but primary key cant allow multiple primary key in single table
-- lets use composite primary key
insert into student (student_name,student_id,student_age)values('Thomas Shleby',1005,25),('Grace Shelby',1006,23);

drop table student ;


create table student (
student_id int not null,
first_name varchar(20) not null,
last_name varchar(30) not null,
student_age int not null,
course_fee int default 2499,
course_name varchar (40) default 'Data Analytics',
primary key (student_id,first_name,last_name)
);

select * from student;
insert into student (first_name,last_name,student_id,student_age)values('Thomas ','Shleby',1005,25),('Grace','Shelby',1006,23);

insert into student (first_name,last_name,student_id,student_age)values('Thomas ','Shleby',1001,25),('Grace','Shelby',1002,23);

-- this allowing same because here im giving unique id so lets drop again

drop table student ;


create table student (
student_id int not null,
first_name varchar(20) not null,
last_name varchar(30) not null,
student_age int not null,
course_fee int default 2499,
course_name varchar (40) default 'Data Analytics',
primary key (first_name,last_name)
);

insert into student (first_name,last_name,student_id,student_age)values('Thomas ','Shleby',1005,25),('Grace','Shelby',1006,23);
-- now it will not work because we made here first name and last name should be unique
insert into student (first_name,last_name,student_id,student_age)values('Thomas ','Shleby',1001,25),('Grace','Shelby',1002,23);

select * from student;







-- about not UNIQUE KEY

create table email_register(
first_name varchar(20) not null,
last_name varchar(30)not null,
email_id varchar(30) not null
);

insert into email_register(first_name,last_name,email_id) values('Ramya','Gowda','ramya1g@gmail.com'),('Ramya','Gowda','ramya1g@gmail.com');

insert into email_register(first_name,last_name,email_id) values('Rakesh','Kumar','rk12@gmail.com'),('Radha','Kumari','rk12@gmail.com');
--  seee both person having same id it will make an issue 
select * from email_register;


-- lets drop table and create with unique key

drop table email_register;



create table email_register(
first_name varchar(20) not null,
last_name varchar(30)not null,
email_id varchar(30) not null unique,
primary key (first_name ,last_name)
);

select * from email_register;

-- these statement send an error to say cannot use same 
-- insert into email_register(first_name,last_name,email_id) values('Ramya','Gowda','ramya1g@gmail.com'),('Ramya','Gowda','ramya1g@gmail.com');

-- insert into email_register(first_name,last_name,email_id) values('Rakesh','Kumar','rk12@gmail.com'),('Radha','Kumari','rk12@gmail.com');

insert into email_register(first_name,last_name,email_id) values('Ramya','Gowda','ramya1g@gmail.com'),('Ramesh','Gowda','ramya11g@gmail.com');

insert into email_register(first_name,last_name,email_id) values('Rakesh','Kumar','rk12@gmail.com'),('Radha','Kumari','rk112@gmail.com');

insert into email_register (first_name ,last_name,email_id) values('Itachi','Uchiha','itachi07@gmail.com');


-- about foreign key
-- Serial also about increment 

create table employee_info (
emp_id serial,
emp_name varchar(20) not null,
emp_age int not null,
emp_department varchar(30) default 'IT',
emp_location varchar (40) default 'Banglore',
primary key(emp_id,emp_name)
);

select * from employee_info;

insert into employee_info (emp_name,emp_age) values('Ramya Gowda',20),('Thomas Shleby',25),('Grace Shelby',23);
insert into employee_info (emp_name,emp_age) values('Sakshi Patil',25),('Ramesh Chadda',28);


