create database join_clause;
-- create table 1
create table courses(Name varchar(20),Course varchar(20));

select  * from COURSES;
INSERT INTO COURSES VALUES('B','Python'),('D','sql'),('E','tableau');
insert into courses values ('E','Data Analytics');
update COURSES set course ='Sql' where name ='D';
update courses set course ='Tableau' where course ='tableau';
update courses set name ='C' where name ='E';

-- create table 2
create table Students(name varchar(20),age int);

select  * from Students;

insert into students values('A',25),('B',26),('C',28),('D',29);

-- now perform join operation 

-- INNER JOIN 

-- select name ,age ,name, course from students,courses;
-- this will send an error 

select students.name age,courses.name ,course from students, courses;
-- it will return with cartesian product 16 rows 



-- ----------------------------------------------------------------------------------------
-- 								Join clauses 
-- -----------------------------------------------------------------------------------------

select students.name, age,courses.name ,course from students inner join courses on students.name =courses.name ;
/*
"B"	"B"	"Python"
"D"	"D"	"Sql"
*/

-- left join
-- these both are same 
select students.name ,age,courses.name ,course from students left join courses on students.name =courses.name ;
select students.name ,age,courses.name ,course from students left outer join courses on students.name =courses.name ;


-- right join
select students.name ,age ,courses.name ,course from students right join courses on students.name =courses.name;
select students.name ,age ,courses.name ,course from students right outer  join courses on students.name =courses.name;


-- full join

select students.name ,age ,courses.name ,course from students full join courses on students.name = courses.name ;

-- -----------------------------------------------------------

-- left only join


select students.name ,age ,courses.name ,course from students left join courses on students.name = courses.name where courses.name is null ;

-- right only join
select students.name ,age ,courses.name ,course from students right join courses on students.name = courses.name where students.name is null ;

-- not inner join

select students.name ,age ,courses.name ,course from students full outer join courses
on students.name = courses.name
where students.name is null or courses.name is null ;


-- union 
-- ------------------------------------------------
-- Creating the 'june' table
CREATE TABLE june (
    day DATE,
    customer VARCHAR(100),
    purchases DECIMAL(10, 2),
    type VARCHAR(20)
);

-- Creating the 'july' table
CREATE TABLE july (
    day DATE,
    customer VARCHAR(100),
    purchases DECIMAL(10, 2),
    type VARCHAR(20)
);

-- Creating the 'aug' table
CREATE TABLE aug (
    day DATE,
    customer VARCHAR(100),
    purchases DECIMAL(10, 2),
    type VARCHAR(20)
);

-- Inserting sample data into 'june' table
INSERT INTO june (day, customer, purchases, type)
VALUES 
    ('2024-06-01', 'John', 50.00, 'cash'),
    ('2024-06-02', 'Alice', 75.50, 'credit card'),
    ('2024-06-03', 'Bob', 30.25, 'cash'),
    ('2024-06-04', 'Emily', 45.75, 'credit card'),
    ('2024-06-05', 'David', 60.00, 'cash'),
    ('2024-06-06', 'Sophia', 25.50, 'credit card'),
    ('2024-06-07', 'Emma', 35.75, 'cash'),
    ('2024-06-08', 'Michael', 70.00, 'credit card'),
    ('2024-06-09', 'Olivia', 80.50, 'cash'),
    ('2024-06-10', 'James', 55.25, 'credit card');
	
	-- Inserting sample data into 'july' table
INSERT INTO july (day, customer, purchases, type)
VALUES 
    ('2024-07-01', 'Liam', 40.00, 'cash'),
    ('2024-07-02', 'Ava', 65.50, 'credit card'),
    ('2024-07-03', 'Ethan', 20.25, 'cash'),
    ('2024-07-04', 'Isabella', 35.75, 'credit card'),
    ('2024-07-05', 'Mason', 50.00, 'cash'),
    ('2024-07-06', 'Charlotte', 75.50, 'credit card'),
    ('2024-07-07', 'William', 30.75, 'cash'),
    ('2024-07-08', 'Amelia', 45.00, 'credit card'),
    ('2024-07-09', 'Benjamin', 60.50, 'cash'),
    ('2024-07-10', 'Mia', 25.25, 'credit card');

-- Inserting sample data into 'aug' table
INSERT INTO aug (day, customer, purchases, type)
VALUES 
    ('2024-08-01', 'Elijah', 70.00, 'cash'),
    ('2024-08-02', 'Harper', 85.50, 'credit card'),
    ('2024-08-03', 'Logan', 40.25, 'cash'),
    ('2024-08-04', 'Evelyn', 55.75, 'credit card'),
    ('2024-08-05', 'Oliver', 60.00, 'cash'),
    ('2024-08-06', 'Abigail', 25.50, 'credit card'),
    ('2024-08-07', 'Lucas', 35.75, 'cash'),
    ('2024-08-08', 'Elizabeth', 70.00, 'credit card'),
    ('2024-08-09', 'Alexander', 80.50, 'cash'),
    ('2024-08-10', 'Sofia', 55.25, 'credit card');
	
select  * from aug;
select  * from june;
select  * from july;

-- Now perform a union
select * from june
union 
select  * from july
union 	
select  * from aug order by day;


-- IF I WANT TO STORE THIS UNION DATA INTO ANOTHER TABLE 
-- IF I DONT WANT TO DOWNLOAD CSV FILE AND WANT TO STORE DATA IN ANOTHER TABLE 

create table union_output as 
select * from june
union 
select  * from july
union 	
select  * from aug order by day;
-- wow that so cool

select * from union_output;


-- view is snapshot copy of calculation or operations
create view 
 union_output_new as 
select * from june
union 
select  * from july
union 	
select  * from aug order by day;

select * from union_output_new;
