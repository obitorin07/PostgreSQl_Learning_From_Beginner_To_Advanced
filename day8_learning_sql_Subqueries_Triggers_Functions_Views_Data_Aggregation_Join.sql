SELECT * FROM AUG;
SELECT * FROM JUNE;
SELECT * FROM JULY;


-- there is no common value in table 
select * from aug left join july on aug.day =july.day
full join june on aug.day =june.day
;

-----------------------SUBQUERY ----------------------
------------------------------------------------------

CREATE DATABASE SUBQUERY;
CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    age INT
);

INSERT INTO student (roll_no, name, marks, age)
VALUES
    (101, 'John Smith', 25, 18),
    (102, 'Emily Johnson', 62, 19),
    (103, 'Michael Brown', 48, 20),
    (104, 'Sarah Lee', 28, 18),
    (105, 'David Wilson', 45, 19),
    (106, 'Jessica Chen', 31, 20),
    (107, 'Kevin Davis', 30, 18),
    (108, 'Rachel Kim', 27, 19),
    (109, 'Daniel Garcia', 79, 20),
    (110, 'Amanda Miller', 94, 18),
    (111, 'Brian Clark', 82, 19),
    (112, 'Olivia Taylor', 91, 20),
    (113, 'Eric Martinez', 75, 18),
    (114, 'Lauren White', 89, 19),
    (115, 'Matthew Hall', 86, 20);
	
	
select * from student order by marks  ;

truncate student;

select * from student where marks >35 and marks<70
order by marks;


-- sub query work (whatever inside here run first like () value excecute first )

select * from student where marks not in (select marks from student where marks >35);
--  it return 5 data because these are not inside the query


create table department (id int primary key, name varchar);
insert into department values(1,'IT'),(2,'HR');
select * from department;

create table employee2
(id serial primary key, 
 name varchar, 
 salary real, 
 departmentId int,
 foreign key(departmentId) references department(id)
);
insert into employee2 (name, salary, departmentId)
values ('Ravi',70000,1),('Ram',90000,1),('Priya',80000,2),('Mohan',75000,2),('Shilpa',92000,1);
select * from employee2;

-- subquery 

select * from employee2 where salary < (select avg(salary) from employee2);
select * from employee2 where salary >= (select avg(salary) as avg_salary from employee2);
-- 1st it sum the all salary
-- 2nd then it counts how many rows 
-- then devide by total_salary/number_of_rows
-- then AVG()

create view less_than_avg_salary as select * from employee2 where salary < (select avg(salary) as avg_salary from employee2);

select * from less_than_avg_salary

insert into employee2(name,salary,departmentid) values('Diksha',63000,2),('Rani',98000,2),('Sanjana',82000,2);

create table all_data as select * from employee2;
create view all_datas as select * from employee2;

select * from employee2;
select * from department;
 
select department.name,department.id ,max(salary)as max_salary from employee2 
inner join department on employee2.departmentid=department.id
 group by department.id;


-- different result 

select department.name,department.id ,employee2.name,
max(salary)as max_salary from employee2 
inner join department 
on employee2.departmentid=department.id
group by department.id,employee2.name;

-- this is not the correct result we want lets use subquery

-- this is what we wanted 
select departmentid,department.name,employee2.name, salary 
from employee2 inner join department 
on employee2.departmentid = department.id 
where (departmentid ,salary) in 
(select departmentid,max(salary) as max_Salary from employee2 group by departmentid);

-- finding the 2nd second highest salary from employee
select  max(salary) as max_Salary from employee2 where salary <(select  max(salary) as max_Salary from employee2);

-- best and perfect way to find 2nd highest salary is using limit offset work like index
select name ,salary as second_highest_salary from employee2
order by salary desc limit 1 offset 1;

-- best and perfect way to find 3rd highest salary is using limit offset work like index
select name ,salary as second_highest_salary from employee2
order by salary desc limit 1 offset 2;



-- TRIGGERS

-- Create table sales_data with default sale_date
CREATE TABLE sales_data (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    sales NUMERIC,
    quantity INT,
    total_price NUMERIC,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM SALES_DATA;

-- Insert data into sales_data (leaving total_price empty)
INSERT INTO sales_data (product_name, sales, quantity)
VALUES
    ('Laptop', 1000, 2),
    ('Smartphone', 500, 5),
    ('Headphones', 200, 3),
    ('Tablet', 700, 1),
    ('TV', 1500, 1),
    ('Camera', 800, 2),
    ('Printer', 300, 4),
    ('Gaming Console', 400, 3),
    ('Fitness Tracker', 100, 10),
    ('Smartwatch', 300, 2);
update sales_Data set total_price =sales*quantity;

INSERT INTO sales_data (product_name, sales, quantity)
VALUES ('Python Book', 200, 3);

update sales_Data set total_price =sales*quantity;

-- we did here again it time consuming
select * from sales_data;
-- first remove data and do automation
UPDATE sales_data
SET total_price = NULL;

create view before_trigger as SELECT * FROM SALES_DATA;


drop trigger the_total_sales on sales_data;
drop function calculate_total_sales()

-- ----------------------------------------------
-- lets do the triggers
create function calculate_total_sales()
returns trigger 
as $$

declare 
total numeric;

begin
total := new.sales *new.quantity;
-- new is taking reference from table name 
new.total_price := total;
return new ;
end ;
$$ language plpgsql;

-- create trigger 

create trigger the_total_sales
before insert on sales_data
for each row
execute function calculate_total_sales()

create view this_is_after_manually as select * from sales_data;

INSERT INTO sales_data (product_name, sales, quantity)
VALUES
    ('Desk', 250, 2),
    ('Chair', 80, 4),
    ('Coffee Maker', 120, 1),
    ('Microwave', 150, 1),
    ('Toaster', 40, 3),
    ('Blender', 90, 2),
    ('Vacuum Cleaner', 200, 1),
    ('Iron', 30, 2),
    ('Cutlery Set', 100, 1),
    ('Television Stand', 150, 1);
	
	select * from sales_data;
	
-- i did drop because while declare variable i reference wrong column that doesnt exist so now okay
drop trigger the_total_sales on sales_data;
drop function calculate_total_sales()

create view after_trigger as select * from sales_data;


