SELECT * FROM employee_data;
alter table employee_data alter salary type decimal(10,2);

drop table employee_data;

CREATE TABLE employee_data (
    employee_name VARCHAR(100),
    salary NUMERIC,
    age INTEGER,
    location VARCHAR(100),
    department VARCHAR(100),
    gender VARCHAR(10)
);

alter table employee_data alter column location set default 'Banglore';

select employee_name ,gender from  employee_data where department ='Sales' order by age;

select employee_name,gender,age from employee_data where age>=20 order by age;

select employee_name from employee_data where gender =' Female';

-- trim() used to remove spaces

select employee_name ,age from employee_data where ltrim(gender) in ('Male','Female');
-- temporary

select employee_name from employee_data where gender = 'Female';



update employee_data set gender =trim(gender);
-- permenant change
-- now it will work as expected

select employee_name from employee_data where gender = 'Female';
select distinct (gender) from employee_data;
select distinct department from employee_data;
SELECT * FROM employee_data;

-- it returns how many

select count (gender) from employee_data ;

select count (age) from employee_data;


select  count(distinct department) from employee_data;
select count(distinct gender ) from employee_data;
-- it return 2 


-- ALIAS

SELECT COUNT(DISTINCT GENDER) AS NUM_OF_GENDERS FROM EMPLOYEE_DATA;
SELECT COUNT(EMPLOYEE_NAME) AS NUMBER_OF_EMPLOYEES FROM EMPLOYEE_DATA

-- ORDER BY CLAUSE

SELECT * FROM EMPLOYEE_DATA;

SELECT EMPLOYEE_NAME FROM EMPLOYEE_DATA ORDER BY EMPLOYEE_NAME ;

-- DES ORDEDESR
SELECT EMPLOYEE_NAME FROM EMPLOYEE_DATA ORDER BY EMPLOYEE_NAME DESC;

SELECT EMPLOYEE_NAME ,AGE,GENDER FROM EMPLOYEE_DATA ORDER BY AGE;

-- DESC ORDER

SELECT EMPLOYEE_NAME ,AGE,GENDER FROM EMPLOYEE_DATA ORDER BY AGE DESC;

SELECT EMPLOYEE_NAME ,AGE ,LOCATION ,SALARY FROM EMPLOYEE_DATA ORDER BY SALARY,AGE ;
-- "Shruti Desai"	20	"Kanpur"	47000
-- "Sneha Bhatt"	41	"Ludhiana"	47000

SELECT EMPLOYEE_NAME ,AGE ,LOCATION ,SALARY FROM EMPLOYEE_DATA ORDER BY SALARY,AGE DESC;
/*"Sneha Bhatt"	41	"Ludhiana"	47000
"Shruti Desai"	20	"Kanpur"	47000*/


SELECT EMPLOYEE_NAME ,AGE ,GENDER,LOCATION ,SALARY FROM EMPLOYEE_DATA ORDER BY SALARY,age ;

--limit

select * from employee_data limit 15;

select * from employee_data order by age limit 5;

select * from employee_Data order by salary limit 10;


select * from employee_Data order by salary desc limit 10;

-- offset
select * from employee_data ;
select * from employee_data limit 10 offset 20;
select * from employee_Data limit 1  offset 29;
select * from employee_Data limit 15  offset 9;
-- 

-- retrive string data from table when we dont know full name of the person or product we use string wild card
select employee_name from employee_data where employee_name like 'S%';

select employee_name from employee_data where employee_name like 'An%';

select * from employee_data where department  like 'I%';

select * from employee_data 
where age> 25 and age <40 order by age ;

-- between to check range 
select * from employee_data where age between 25 and 40;


select * from employee_data where salary between 47000 and 50000 order by salary;


-- 'IN' operators -------------------------------------------------------------

select * from employee_data where location ='Bangalore' or location = 'Kanpur';

-- lets make this simple 

select * from employee_Data where location in ('Mumbai','Bangalore','Kanpur','Chennai');


select * from employee_Data order by location;
select count(gender) as genders from employee_Data;


