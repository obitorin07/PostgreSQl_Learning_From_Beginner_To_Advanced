select * from employees;


-- wild cards
select * from employees order by name;

select * from employees where name like '%U%'; -- it will return whos name start or end with u


select * from employees where name like 'Ob%';

delete from employees where id =10;

insert into employees(name,dept,salary,location,status)values
('itachi uchiha','HR',45000,'Delhi','Active'),
('Shisui uchiha','IT',47000,'Delhi','Active');


-- we cant get back our data right once delete ? 

-- lets use TCL command then this is beauty of tcl cmd

-- first we need to tell sql to track our record
begin; -- it will start tracking our data 


select * from employees;

delete from employees where location like 'D%'; -- it removes location where name start with D like Delhi

rollback; -- it call back all delete data after begin/ or we told sql to track

commit ; -- it is like making sure tell sql to stop track my data and it is like also #static 





-- case statement it is like IF ELSE in other language

create table product (product_name varchar, quantity int);

insert into product values ('Charis', 20),('Tables',5),('Bookcases',10),('Storage',25),('Phones',18);

select * from product;

insert into product values ('Copiers', null);

-- lets use conditional statements

select product_name ,quantity,

case -- starting line of case statement 

	when quantity>10 then 'Quantity is more than 10'  
	--this  is like WHEN(if) and THEN (print) 
	when quantity<10 then 'Quantity is Less than 10' 
	
	when quantity =10 then 'Quantity is equal to 10'
	
	ELSE 'No Stocks/Quantities'
	-- it is like else
	
END as Stock_information

from product;





-- lets create view

create view case_statements as
select product_name ,quantity,

case -- starting line of case statement 

	when quantity>10 then 'Quantity is more than 10'  
	--this  is like WHEN(if) and THEN (print) 
	when quantity<10 then 'Quantity is Less than 10' 
	
	when quantity =10 then 'Quantity is equal to 10'
	
	ELSE 'No Stocks/Quantities'
	-- it is like else
	
END as Stock_information

from product;

select * from case_statements;