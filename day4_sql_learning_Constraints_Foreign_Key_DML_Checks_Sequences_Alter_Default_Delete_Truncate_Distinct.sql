create table department(dept_id serial primary key,dept_name varchar(20)not null,dept_head varchar(20)not null);
select * from department;
insert into department(dept_head, dept_name) values('Rajesh Kumar','IT'),('Reena Singh','HR');
insert into department(dept_head,dept_name) values('Priya Sharma', 'Marketing');

drop table department;

create table department(dept_id serial ,dept_name varchar(20)not null primary key,dept_head varchar(20)not null);

create table employee(id serial ,first_name varchar(20) not null,last_name varchar(20) not null,location varchar(20) default 'Banglore' ,dept_name varchar(20)not null primary key);

drop table employee;
create table employee(id serial primary key ,first_name varchar(20) not null,last_name varchar(20) not null,location varchar(20) default 'Banglore' ,dept_name varchar(20)not null);
select * from employee;

alter table employee drop last_name;
alter table employee rename first_name to full_name ;

insert into employee (full_name,dept_name)
values
('Anita Mishra', 'HR'),
('Sanjay Sharma', 'Marketing'),
('Meera Desai', 'IT');
	
select * from employee;

insert into employee (full_name,dept_name)
values('Sanjay Shah', 'Production'),
('Meera Desai', 'Quality Assurance');

-- adding foreign key 

alter table employee add foreign key (dept_name) references department(dept_name);

-- it shows error show first remove those data 

select * from employee;

delete from employee where id =4;
delete from employee where id in(5);

-- lets run now again
alter table employee add foreign key (dept_name) references department(dept_name);

-- it will send an error because production and QA not exist in department table 
insert into employee (full_name,dept_name)
values('Sanjay Shah', 'Production'),
('Meera Desai', 'Quality Assurance');

-- this will work now 

INSERT INTO employee (full_name,dept_name)
VALUES 
    ('Rajesh Kumar', 'IT'),
    ('Reena Singh', 'HR'),
    ('Priya Sharma', 'Marketing'),
    ('Sachin Gupta', 'IT'),
    ('Amit Patel', 'HR'),
    ('Neha Verma', 'Marketing'),
    ('Vikram Singh', 'IT'),
    ('Anita Mishra', 'HR'),
    ('Sanjay Sharma', 'Marketing'),
    ('Meera Desai', 'IT');
	
select * from employee;
	
select distinct(full_name ) from employee;


-- now this will not allow right 
insert into employee (full_name,dept_name)values('Ramesh kumar','Doctor');
-- now upper statement will work now
insert into department (dept_head,dept_name)values('Ramesh kumar','Doctor');

insert into employee (full_name,dept_name)values('Sakshi kumari','Doctor');

-- when i try to remove that dept from department table it will send an error 
delete from department where dept_name='Doctor';
-- first remove data from employee then department it will work

delete from employee where dept_name='Doctor';




-- Check constraint 

create table school(

student_name varchar not null,
school_name varchar default '360digitmg',
age int,
check (age>=15));

select * from school;
insert into school(student_name,age) values('Rakesh Kumar',22),('Kiran Kb',21);	
-- this value will not allow 
insert into school(student_name,age) values('Vijay Kumar',12);	



-- prodcuct table create

create table product(product_no serial ,product_name varchar ,price numeric check(price>0));

insert into product values(1,'Shampoo',10);

select * from product;

insert into product(product_name,price) values('Hairoil',220);
update product set product_no =2 where price=220;

alter table product add primary key (product_no);

insert into product(product_name,price) values('Soap',20);
alter table product drop product_no;

alter table product add column product_no serial primary key;

truncate product;
select * from product;

alter table product alter product_name type varchar(25);
-- here i add 25 charcters only accept