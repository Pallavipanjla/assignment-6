CREATE TABLE Employee(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
name CHAR(20) NOT NULL,
exp INT CHECK(exp>=2), 
salary INT CHECK(salary BETWEEN 5000 AND 30000),
department_name CHAR(20) CHECK(department_name IN('HR','Sales','Accts','IT')), 
manager_name CHAR(20)
);

ALTER TABLE Employee AUTO_INCREMENT=100;

INSERT INTO Employee(name,exp,salary,department_name,manager_name) 
VALUES ('Aman',3,8000,'HR','Payal'),
('Pallavi',5,25000,'Sales','Rohit'),
('Meena',4,22000,'IT','Raj'),
('Advik',6,28000,'Accts','Ravi'),
('Ajay',7,10000,'HR','Rohit');
-- Q-1
SELECT employee_id,name,salary FROM Employee;

-- Q-2
SELECT employee_id AS 'Employee ID',name AS 'Name of Employee',salary AS 'Salary of Employee' FROM Employee;

-- Q-3
SELECT name,salary,salary+5000 AS incremented_salary FROM Employee;

-- Q-4
SELECT department_name,SUM(salary) AS total_salary FROM Employee GROUP BY department_name;

-- Q-5
SELECT department_name,SUM(salary) AS total_salary,MAX(salary) AS max_salary,AVG(salary) AS avg_salary FROM Employee GROUP BY department_name;

-- Q-6
SELECT * FROM Employee ORDER BY salary DESC;

-- Q-7
SELECT ROW_NUMBER() OVER(ORDER BY employee_id) AS sequence_no,name,salary FROM Employee;

-- Q-8
SELECT RANK() OVER(ORDER BY salary DESC) AS rank_no,name,salary FROM Employee;

-- Q-9
ALTER TABLE Employee ADD age INT;

-- Q-10
ALTER TABLE Employee MODIFY age INT DEFAULT 26;
UPDATE Employee SET age=26 WHERE age IS NULL;
SELECT * FROM Employee;

-- Q-11
ALTER TABLE Employee ADD CONSTRAINT CHK_AGE CHECK(age BETWEEN 26 AND 60); UPDATE Employee SET age=26 WHERE age IS NULL;

-- Q-12
SELECT COUNT(DISTINCT department_name) AS total_departments FROM Employee;

-- Q-13
SELECT UPPER(name) FROM Employee;

-- Q-14
SELECT SUBSTRING(name,1,4) FROM Employee;

-- Q-15
SELECT name,INSTR(name,'a') AS position_of_a FROM Employee;

-- Q-16
SELECT department_name,COUNT(*) AS total_employees FROM Employee GROUP BY department_name;

-- Q-17
SELECT manager_name,COUNT(*) AS total_employees FROM Employee GROUP BY manager_name;

-- Q-18
SELECT * FROM Employee WHERE employee_id IN(101,102,110);

-- Q-19
SELECT * FROM Employee WHERE employee_id BETWEEN 101 AND 110;

-- Q-20
SELECT * FROM Employee WHERE department_name='HR';

-- Q-21
SELECT * FROM Employee WHERE department_name IN('HR','Accts');

-- Q-22
SELECT * FROM Employee WHERE name LIKE 'A%';

-- Q-23
SELECT * FROM Employee WHERE name LIKE '%a%';

-- Q-24
SELECT department_name,AVG(salary) AS avg_salary 
FROM Employee 
GROUP BY department_name 
HAVING AVG(salary)<12000;

-- Q-25
SELECT * FROM Employee WHERE department_name<>'Accts' AND salary NOT BETWEEN 10000 AND 20000;
