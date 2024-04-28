select * from employees;
alter table employees add column status varchar(20) ;

update employees set status = 'Active';

ALTER TABLE employees
ALTER COLUMN status SET NOT NULL


-- creating function for update date automatically when employee not active

create function update_on_status_change()
returns trigger as $$
begin 
new.last_updated =now(); -- it wil display data is updated 
return new;
end;
$$ language plpgsql;

create trigger for_update_status
before update on employees
for each row
execute function update_on_status_change()


select * from employees;
create view data_update as select * from employees;

-- 

update employees set status ='InActive' where id =4;
-- "2024-04-18 21:56:07.343581"	48000	"2024-04-25 16:10:32.144669"	date time automatically update in last_updated 




-- indexing in post gress
create table emp_table(id serial primary key, emp_name varchar, salary numeric);

insert into emp_table(emp_name, salary) 
values('Ravi',50000),('John',90000),('Shilpa',80000),('Priya',55000),('Mohan',75000),('Akhil',75000),('Manoj',95000),
 ('Shekar',60000),('Kumar',65000),('Komal',95000);

select * from emp_table;


select * from emp_table where salary=55000; -- Total rows: 1 of 1 Query complete 00:00:00.153


create index salary_index on emp_table(salary);


select * from emp_table where salary=55000; --Total rows: 1 of 1Query complete 00:00:00.092


-- this saves times and reduce load to system and also help to retrive data quickly


explain 
select * from emp_table where salary=55000;

-- DCL COMMANDS
-- 0---------------------------------------------

CREATE USER obitorin password '123456';

-- after that go to in postgres/postgres@Postgressql16
-- then click for new connection and choose there new user for this database

select * from employees;
-- ERROR:  permission denied for table employees the use dont have access yet
-- user dont havae permissions so now switch to root first


grant select on employees to obitorin;
-- now again switch to user 

select * from employees;
-- now it will work because it already have permission to access table



-- now user trying to update table it will definatly say an permission denied

update employees set status='InActive' where id = 6;
-- ERROR:  permission denied for table employees 
-- switch to root user
-- lets give the access to user 

grant update on employees to obitorin;
-- switch to user now again 
update employees set status='InActive' where id = 6;
-- UPDATE 1
--Query returned successfully in 119 msec.

select * from employees;

delete from employees where status ='InActive';
-- same issue again it decline 

-- do the same thing again give access

grant insert,delete on employees to obitorin;

-- now switch

delete from employees where status ='InActive';

select * from employees;

-- it worked

-- granting revoking at once all
grant all on employees to obitorin;
revoke all on employees from obitorin;

drop user obitorin;







-- ----------------------------------------------------------------mysql commands


mysql> use day9;
Database changed
mysql> create table emp_table(id int auto_increment primary key,emp_name varchar(20),salary int);
Query OK, 0 rows affected (0.06 sec)






mysql> select * from emp_table where salary =55000;
+----+----------+--------+
| id | emp_name | salary |
+----+----------+--------+
|  4 | Priya    |  55000 |
+----+----------+--------+
1 row in set (0.00 sec)

mysql> explain select * from emp_table where salary =55000;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | emp_table | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   10 |    10.00 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)





-- about index--------------------------------------------------------------------


mysql> create index salary_index on emp_table (salary);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from emp_table where salary =55000;
+----+----------+--------+
| id | emp_name | salary |
+----+----------+--------+
|  4 | Priya    |  55000 |
+----+----------+--------+
1 row in set (0.00 sec)

mysql> explain select * from emp_table where salary =55000;
+----+-------------+-----------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | emp_table | NULL       | ref  | salary_index  | salary_index | 5       | const |    1 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)












