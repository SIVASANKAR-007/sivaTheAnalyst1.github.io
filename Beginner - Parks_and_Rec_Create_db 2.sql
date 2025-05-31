CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');
 # where clause in My Sql
select * from employee_salary where first_name = 'leslie'
;
select * from employee_salary where salary >= 50000

select * from employee_salary where salary < 50000

select * from employee_salary where salary <= 50000

select * from employee_demographics
where gender = 'Female'
;
select * from employee_demographics
where gender != 'Female'

select * from employee_demographics
where birth_date  > '1985-01-01'
;

-- AND or NOT -- Logical operators
select * from employee_demographics
where birth_date  > '1985-01-01'
and gender = 'male'
;
select * from employee_demographics
where birth_date  > '1985-01-01'
or gender = 'male'
;
select * from employee_demographics
where birth_date  > '1985-01-01'
or not gender = 'male'
;
select * from employee_demographics
where First_name = 'Leslie' and age = 44
;
select * from employee_demographics
where (First_name = 'Leslie' and age = 44) or age > 55
;
-- like statement
-- % and -
select * from employee_demographics
where First_name like 'jer%'
;
select * from employee_demographics
where First_name like '%er%'
;
select * from employee_demographics
where First_name like 'a%'
;
select * from employee_demographics
where First_name like 'a__'  # output a plus two characters ann (based on how many _)
;
select * from employee_demographics
where First_name like 'a___'  # output a plus 3 characters andy (based on how many _)
;
select * from employee_demographics
where First_name like 'a___%'  # output a plus 3 characters april,andy(based on how many _)
;
select * from employee_demographics
where birth_date like '1989%' # output is based on year andy(based on which year u mentioned )
;
  
-- Group by

use lee
SELECT * FROM employee_demographics;

SELECT gender FROM employee_demographics group by gender;

SELECT gender,avg(age) FROM employee_demographics group by gender;

SELECT occupation FROM employee_salary group by occupation;

SELECT occupation,salary FROM employee_salary group by occupation,salary;

SELECT gender, avg(age), max(Age), min(age) FROM employee_demographics group by gender;


-- order by

SELECT * FROM employee_demographics Order by first_name;

SELECT * FROM employee_demographics Order by first_name asc;

SELECT * FROM employee_demographics Order by first_name desc;

SELECT * FROM employee_demographics Order by gender;

SELECT * FROM employee_demographics Order by gender,age;

SELECT * FROM employee_demographics Order by gender,age desc;

SELECT * FROM employee_demographics Order by 5,4 desc; # 5 is gender in column no 5,4 is age in column no 4

-- Having vs where

use lee
select gender, avg(age) from employee_demographics group by gender having avg(age) >40

select occupation, avg(salary) from employee_salary group by occupation

select occupation, avg(salary) from employee_salary 
where occupation like '%manager%' group by occupation having avg(salary) >75000

-- LIMIT & ALIASING
USE lee

SELECT * FROM employee_demographics;

SELECT * FROM employee_demographics limit 3;

SELECT * FROM employee_demographics order by age desc limit 3;

SELECT * FROM employee_demographics order by age desc limit 2, 1

-- Aliasing

SELECT gender, avg(age) from employee_demographics group by gender having avg(age) >40;

SELECT gender, avg(age) as avg_age from employee_demographics group by gender having avg_age >40;

SELECT gender, avg(age) avg_age from employee_demographics group by gender having avg_age >40;


-- JOINS

USE LEE

select * from employee_demographics;

select * from employee_salary;

select * from employee_demographics
inner join employee_salary
   on employee_demographics.employee_id = employee_salary.employee_id;
   
select * from employee_demographics as dem
inner join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
select dem.employee_id,age, occupation from employee_demographics as dem
inner join employee_salary as sal
   on dem.employee_id = sal.employee_id;
  -- outer join 
   
select * from employee_demographics as dem
left join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
select * from employee_demographics as dem
right join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
   
-- self join
select * 
from employee_salary emp1
join employee_salary emp2
   on emp1.employee_id = emp2.employee_id
;

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary emp1
join employee_salary emp2
   on emp1.employee_id +1 = emp2.employee_id
   
   
-- joining multiple tables together

select * from employee_demographics as dem
inner join employee_salary as sal
   on dem.employee_id = sal.employee_id
inner join parks_departments pd
    on sal.dept_id = pd.department_id
;

select * from parks_departments;



-- Unions
use Lee
select * from employee_demographics;

select Age,gender from employee_demographics
union
select first_name, last_name from employee_salary;


select Age,gender from employee_demographics
union     #use union for same values to avoid Mixup
select first_name, last_name from employee_salary;

select first_name, last_name from employee_demographics
union     #use union for same values to avoid Mixup
select first_name, last_name from employee_salary;

select first_name, last_name from employee_demographics
union distinct     #when we use distinct we got only one table values
select first_name, last_name from employee_salary;


select first_name, last_name from employee_demographics
union all     #when we use all we got all table values
select first_name, last_name from employee_salary;


select first_name, last_name, 'old' from employee_demographics
where age > 50;

select first_name, last_name, 'old' as label from employee_demographics
where age > 50;

select first_name, last_name, 'old' as label from employee_demographics where age > 50
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary where salary > 70000;

select first_name, last_name, 'old man' as label 
from employee_demographics where age > 50 and gender = "male"
union
select first_name, last_name, 'old lady' as label 
from employee_demographics where age > 40 and gender = "female"
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary where salary > 70000;

select first_name, last_name, 'old man' as label 
from employee_demographics where age > 40 and gender = "male"
union
select first_name, last_name, 'old lady' as label 
from employee_demographics where age > 40 and gender = "female"
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary where salary > 70000
order by first_name, last_name ;

-- String Functions

use lee

select LENGTH ('skyfall');

select first_name, length(first_name) from employee_demographics;

select first_name, length(first_name) from employee_demographics order by 2;

select upper("Sky Fall");

select lower("Sky Fall");

select first_name, upper(first_name) from employee_demographics;

select trim(             'Skyfall'          );

select ltrim(             'Skyfall'          );

select rtrim(             'Skyfall'          );

select first_name, left(first_name, 5) from employee_demographics; 
# it provides only left 5 letters in first name

select first_name, left(first_name, 5),right(first_name, 5) from employee_demographics;
# it provides only  left & right 5 letters in first name

select first_name, left(first_name, 5),right(first_name, 5),
substring(first_name,3,2) # it provides 3rd position 2 letters in first_name
from employee_demographics;

select first_name, left(first_name, 5),right(first_name, 5),
substring(first_name,3,2), # it provides 3rd position 2 letters in first_name
birth_date, substring(birth_date ,6,2) as birth_month 
# it provides 6th position 2 letters in birth_date
from employee_demographics;


-- Replace
select * from employee_demographics;

select first_name, replace(first_name, 'a','z') from employee_demographics;
# it replace first_name title into "a","z" it reflects in table data to

-- locate
select locate('l','sankarlee');
# it shows the which place the letter stored

select first_name, locate('An', first_name) from employee_demographics;
# it  shows which name contains An 'In' data

-- concat

select first_name, last_name, concat(first_name,' ',last_name) as Full_name 
from employee_demographics;
# its concate first_name and last_name in full_name

