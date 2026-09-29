create database school3;
create table worker2(worker_id int primary key,
first_name varchar(100),
last_name varchar(100),
salary int,
joining_date TIMESTAMP,
department varchar(100));
select*from worker2;
Insert into worker2 (worker_id, first_name, last_name,salary, joining_date, department)
values
(1,c','arora',100000,'2014-02-20 09:00:00','hr'),
(2,'niharika','verma',80000,'2014-06-11 09:00:00','admin'),
(3,'vishal','singhal',300000,'2014-02-20 09:00:00','hr'),
(4,'amitabh','singh',500000,'2014-02-20 09:00:00','admin'),
(5,'vivek','bhati',500000,'2014-06-11 09:00:00','admin'),
(6,'vipul','diwan',200000,'2014-06-11 09:00:00','account'),
(7,'sarish','kumar',75000,'2014-01-20 09:00:00','account'),
(8,'geetika','chauhan',90000,'2014-04-11 09:00:00','admin');
select*from worker2;
create table bonus1(worker_ref_id int ,
bonus_date TIMESTAMP,
bonus_amount int);
select*from bonus1;
Insert into bonus1(worker_ref_id, bonus_date, bonus_amount)
values
(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500);


create table title(worker_ref_id int REFERENCES worker(worker_id),
worker_title varchar(100),
affected_from TIMESTAMP);
select*from title;

Insert into title(worker_ref_id,worker_title, affected_from)
values
(1,'manager','2016-02-20 00:00:00'),
(2,'executive','2016-06-11 00:00:00'),
(8,'executive','2016-06-11 00:00:00'),
(5,'manager','2016-06-11 00:00:00'),
(4,'asst.manager','2016-06-11 00:00:00'),
(7,'executive','2016-06-11 00:00:00'),
(6,'lead','2016-06-11 00:00:00'),
(3,'lead','2016-06-11 00:00:00');
select first_name as worker_name from worker2;
select UPPER(first_name) as UPPER_CASE_first_name from worker2





select department,count(*)as worker from worker group by department;
SELECT SUBSTRING(first_name, 1, 3) AS first_three_chars
FROM worker2;
SELECT POSITION('a' IN first_name) AS position_of_a
FROM worker2 where first_name ='amitabh';
select  RTRIM(first_name)as trimed_first_name
from worker2;
select  LTRIM(department)as trimed_department
from worker2;
select distinct(department),length (department) as department_length from worker2;
select REPLACE(first_name, 'a', 'A') AS updated_first_name
FROM worker2;
SELECT CONCAT(first_name, ' ', last_name) AS complete_name 
FROM worker2;
select 
*from worker2 where first_name in ('vipul','sarish');
SELECT *
FROM worker2 
WHERE first_name NOT IN ('vipul', 'sarish');
SELECT *
FROM worker2
WHERE department = 'admin';
select*from worker2 where salary between 100000 and 500000;
select*
FROM worker2 
Where extract (MONTH from joining_date) =2 and extract (YEAR from joining_date)=2014;
select*
from WORKER2  where salary>=50000 and salary<=100000;
select department ,count(*) as number_of_worker
from worker2
group by department 
order by number_of_worker desc;
select w.*
from worker2 w
join title t on w.worker_id=t.worker_ref_id
where t.worker_title='manager';
SELECT first_name,last_name,department,COUNT(*) 
FROM worker2
GROUP BY first_name, last_name,department
HAVING COUNT(*) > 1;



CREATE TABLE worker2_clone AS
SELECT *
FROM worker2;



SELECT worker_id
FROM worker2
INTERSECT
SELECT worker_ref_id
FROM bonus1;
SELECT *FROM worker2
WHERE worker_id NOT IN (SELECT worker_ref_id FROM bonus1);
select now()as current_Date_time;
SELECT *FROM worker2
LIMIT 5;
SELECT*
FROM worker2
ORDER BY salary DESC
limit 5;
SELECT DISTINCT salary
FROM worker2
ORDER BY salary DESC
LIMIT 1 OFFSET 4;

SELECT salary,
 CONCAT(first_name, ' ', last_name) AS employees
FROM worker2
GROUP BY salary
HAVING COUNT(*) > 1;
SELECT salary,
       GROUP_CONCAT(CONCAT(first_name, last_name)) AS employees
FROM worker2
GROUP BY salary
HAVING COUNT(*) > 1;
SELECT 
    w.worker_id,
    w.first_name,
    w.last_name,
    w.salary,
    w.department
FROM 
    worker w
WHERE 
    w.salary IN (
        SELECT salary
        FROM worker
        GROUP BY salary
        HAVING COUNT(*) > 1
    )
ORDER BY 
    w.salary DESC;

SELECT salary 
FROM worker2
ORDER BY salary DESC
LIMIT 1 ;
SELECT * FROM worker2
UNION ALL
SELECT * FROM worker2 WHERE worker_id = 1;
SELECT *
FROM worker2
ORDER BY RANDOM()
LIMIT (SELECT COUNT(*)/2 FROM worker2);
SELECT department, COUNT(*) AS total_employees
FROM worker2
GROUP BY department
HAVING COUNT(*) < 5;

SELECT *
FROM worker2
ORDER BY worker_id DESC
LIMIT 1;
SELECT *
FROM worker2
ORDER BY worker_id asc
LIMIT 1;
SELECT *
FROM worker2
ORDER BY worker_id DESC
LIMIT 5;
SELECT *
FROM worker2
ORDER BY salary DESC
LIMIT 3;
SELECT *
FROM worker2
ORDER BY salary asc
LIMIT 3;

SELECT DISTINCT salary
FROM worker2
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
SELECT department, SUM(salary) AS total_salary
FROM worker2
GROUP BY department;
SELECT first_name, last_name, salary
FROM worker2
WHERE salary = (SELECT MAX(salary) FROM worker2);
SELECT first_name, last_name, department, salary
FROM worker2 w
WHERE salary = (
    SELECT MAX(salary)
    FROM worker2
    WHERE department = w.department
);
SELECT * FROM worker2 WHERE worker_id = 1
UNION ALL
SELECT * FROM worker2 WHERE worker_id = 1;
SELECT department, COUNT(*) AS number_of_people
FROM worker2
GROUP BY department;
