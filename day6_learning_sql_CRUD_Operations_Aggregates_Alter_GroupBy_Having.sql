-- CRUD OPERATION CREATE RETRIVE UPDATE DELETE
/*
CREATE DDL
RETRIVE DQL SELECT
UPDATE DML
DELETE DML
*/

CREATE TABLE EMPLOYEES(
ID SERIAL PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
DEPT VARCHAR(20) NOT NULL,
DATE_OF_JOINING TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
SALARY REAL NOT NULL,
LAST_UPDATED TIMESTAMP DEFAULT NOW());

SELECT * FROM EMPLOYEES;

insert into employees(name,dept,salary )values
('Rajesh Kumar','HR',45000.00),
('Reena Mulla','IT',43000.00),
('Pooja Sharma','IT',42000.00);

INSERT INTO employees (name, dept, salary) VALUES
('Suresh Patel', 'Finance', 48000.00),
('Priya Singh', 'Finance', 49000.00),
('Amit Gupta', 'Marketing', 46000.00),
('Anita Reddy', 'Marketing', 47000.00),
('Neha Kapoor', 'Sales', 45000.00),
('Vijay Khanna', 'Sales', 47000.00),
('Kiran Joshi', 'Sales', 48000.00),
('Meera Desai', 'Sales', 49000.00),
('Rajesh Sharma', 'Sales', 50000.00),
('Rahul Mehta', 'Sales', 51000.00);


select count(*) as number_of_rows from employees;
-- it counts all the rows in table 

-- returns unique how many departments are exists in table
select count(distinct dept) as unique_department from employees;

SELECT * FROM EMPLOYEES;
select * from employees order by salary;

select count(name)from employees where salary between 42000 and 48000;
select count(name)from employees where salary>42000 and salary <48000;

select * from employees order by salary;
-- this is just for my understanding just ignore it 
-- between is like a>=b it counts from 0 to 10
-- and is like a>b count from next value 1 to 9


select count(distinct salary) from employees where salary >42000 and salary <48000;

-- sum agrigation
select sum(salary)as total_salary from employees;

-- avg agrigation function

select avg(salary) as the_avarage_salary_of_employess from employees;

-- Agrigated functions in sql

select count(salary) from employees;
select avg(salary) from employees;
select min (salary) from employees;
select max (salary) from employees;
select sum(salary) from employees;


select name,salary from employees order by salary ;
select* from employees;

-- now  i want to add location column

alter table employees add column location varchar(30) not null default 'Bangalore';

--  i want to update some row  location 

/*
2	"Reena Mulla"	"IT"	"2024-04-18 21:32:17.287003"	43000	"2024-04-18 21:32:17.287003"	"Bangalore"
3	"Pooja Sharma"	"IT"	"2024-04-18 21:32:17.287003"	42000	"2024-04-18 21:32:17.287003"	"Bangalore"
*/

update employees set location ='Mumbai' where id in(2,3);
/* 
2	"Reena Mulla"	"IT"	"2024-04-18 21:32:17.287003"	43000	"2024-04-18 21:32:17.287003"	"Mumbai"
3	"Pooja Sharma"	"IT"	"2024-04-18 21:32:17.287003"	42000	"2024-04-18 21:32:17.287003"	"Mumbai"
-- 
*/
-- it will update for all rows
update employees set location ='Chennai';



-- delete operations

delete from employees where id in (11,12);

select * from employees;

delete from employees where name ='Rahul Mehta';

select * from employees order by id;

update employees set location = 'Delhi';

update employees set name ='Obito Uchiha' where id =1;

select location,count(*) from employees group by location;

select * from employees;

update employees set location = 'Mumbai' where id in(1,2);

update employees set location = 'Pune' where id in(3,5);

update employees set location ='Hydrabad' where dept ='Sales';


select location,count(*) as number_of_employees from employees group by location;

/*
"Mumbai"	2
"Pune"	2
"Hydrabad"	3
"Delhi"	3
*/

select * from employees order by salary;
/*
3	"Pooja Sharma"	"IT"	"2024-04-18 21:32:17.287003"	42000	"2024-04-18 21:32:17.287003"	"Pune"
2	"Reena Mulla"	"IT"	"2024-04-18 21:32:17.287003"	43000	"2024-04-18 21:32:17.287003"	"Mumbai"
1	"Obito Uchiha"	"HR"	"2024-04-18 21:32:17.287003"	45000	"2024-04-18 21:32:17.287003"	"Mumbai"
8	"Neha Kapoor"	"Sales"	"2024-04-18 21:56:07.343581"	45000	"2024-04-18 21:56:07.343581"	"Hydrabad"
6	"Amit Gupta"	"Marketing"	"2024-04-18 21:56:07.343581"	46000	"2024-04-18 21:56:07.343581"	"Delhi"
7	"Anita Reddy"	"Marketing"	"2024-04-18 21:56:07.343581"	47000	"2024-04-18 21:56:07.343581"	"Delhi"
9	"Vijay Khanna"	"Sales"	"2024-04-18 21:56:07.343581"	47000	"2024-04-18 21:56:07.343581"	"Hydrabad"
10	"Kiran Joshi"	"Sales"	"2024-04-18 21:56:07.343581"	48000	"2024-04-18 21:56:07.343581"	"Hydrabad"
4	"Suresh Patel"	"Finance"	"2024-04-18 21:56:07.343581"	48000	"2024-04-18 21:56:07.343581"	"Delhi"
5	"Priya Singh"	"Finance"	"2024-04-18 21:56:07.343581"	49000	"2024-04-18 21:56:07.343581"	"Pune"

*/


select dept,location ,count(*) as number_of_dept_by_location from employees  where salary >45000 group by (location,dept);

select * from employees;

-- having

select location ,count(*) from employees group by location ;
/*
"Mumbai"	2
"Pune"	2
"Hydrabad"	3
"Delhi"	3
*/


select location ,count(*) from employees group by location having count(*)>1;

select * from employees;

select location,dept, count (*) as_number_of_min
from employees
group by (location,dept) having min(salary)>45000 ;


select location ,count(*) as number_of_employees from employees where location ='Hydrabad' group by location;
-- it first retrive all data then where clause work after then it do a group then it counts how many employees

select location , count(*)as number_of_emps from employees group by location having location ='Hydrabad';
-- both did same thing but here it retrive data first later it grouped data by locations then it looking for locations thenm it counts
