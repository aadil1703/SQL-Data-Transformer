--Customers table:
create table customers
(
    CustomerId INT auto_increment primary key,
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    Email varchar(50) NOT NULL,
    RegistrationDate DATE NOT NULL
);
insert into customers (FirstName, LastName, Email, RegistrationDate) values
("John", "Doe", "john.doe@gmail.com","2022-03-15"),
("Jane", "Smith", "jane.smith@gmail.com","2021-11-02"),
("Robert", "Johnson", "robert.j@gmail.com", "2023-01-10"),
("Emily", "Davis", "emily.davis@yahoo.com", "2023-05-22"),
("Michael", "Brown", "mbrown@outlook.com", "2024-02-18");

select * from customers;
+------------+-----------+----------+-----------------------+------------------+
| CustomerId | FirstName | LastName | Email                 | RegistrationDate |
+------------+-----------+----------+-----------------------+------------------+
|          1 | John      | Doe      | john.doe@gmail.com    | 2022-03-15       |
|          2 | Jane      | Smith    | jane.smith@gmail.com  | 2021-11-02       |
|          3 | Robert    | Johnson  | robert.j@gmail.com    | 2023-01-10       |
|          4 | Emily     | Davis    | emily.davis@yahoo.com | 2023-05-22       |
|          5 | Michael   | Brown    | mbrown@outlook.com    | 2024-02-18       |
+------------+-----------+----------+-----------------------+------------------+

---------------------------------------------------------------------------------------

--ORDER TABLE:

create table orders
(
    OrderId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount FLOAT not null
);

insert into orders (OrderId,CustomerId,OrderDate,TotalAmount) values
(101, 1, "2023-07-01", 150.50),
(102, 2, "2023-07-03", 200.75),
(103, 1, "2023-08-15", 45.00),   -- Second order for John Doe
(104, 3, "2023-09-12", 320.10),  -- Order for Robert Johnson
(105, 4, "2023-10-05", 89.95),   -- Order for Emily Davis
(106, 3, "2023-11-20", 12.50);

select * from orders;
+---------+------------+------------+-------------+
| OrderId | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |       150.5 |
|     102 |          2 | 2023-07-03 |      200.75 |
|     103 |          1 | 2023-08-15 |          45 |
|     104 |          3 | 2023-09-12 |       320.1 |
|     105 |          4 | 2023-10-05 |       89.95 |
|     106 |          3 | 2023-11-20 |        12.5 |
+---------+------------+------------+-------------+

-----------------------------------------------------------------------------------------

--EMPLOYEES TABLE:

create table employees
(
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    Department varchar(20) NOT NULL,
    HireDate date not null,
    Salary float
);

insert into employees (FirstName,LastName,Department,HireDate,Salary) values
("Mark","Johnson","Sales","2020-01-15",50000.00),
("Susan","Lee","HR","2021-03-20",55000.00),
("David", "Miller", "IT", "2021-06-15", 85000.00),
("Sophia", "Wilson", "IT", "2023-02-10", 92000.00),
("James", "Taylor", "IT", "2025-01-11", 60000.00),
("Olivia", "Anderson", "HR", "2020-03-22", 68000.00),
("Daniel", "Thomas", "HR", "2024-07-19", 55000.00),
("Isabella", "Jackson", "Marketing", "2022-11-05", 72000.00),
("Lucas", "White", "Marketing", "2023-08-01", 67000.00),
("Mia", "Harris", "Finance", "2019-05-14", 95000.00),
("Ethan", "Martin", "Finance", "2022-04-25", 81000.00),
("Alexander", "Clark", "Sales", "2024-09-30", 62000.00);

select * from employees;
+------------+-----------+----------+------------+------------+--------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary |
+------------+-----------+----------+------------+------------+--------+
|          1 | Mark      | Johnson  | Sales      | 2020-01-15 |  50000 |
|          2 | Susan     | Lee      | HR         | 2021-03-20 |  55000 |
|          3 | David     | Miller   | IT         | 2021-06-15 |  85000 |
|          4 | Sophia    | Wilson   | IT         | 2023-02-10 |  92000 |
|          5 | James     | Taylor   | IT         | 2025-01-11 |  60000 |
|          6 | Olivia    | Anderson | HR         | 2020-03-22 |  68000 |
|          7 | Daniel    | Thomas   | HR         | 2024-07-19 |  55000 |
|          8 | Isabella  | Jackson  | Marketing  | 2022-11-05 |  72000 |
|          9 | Lucas     | White    | Marketing  | 2023-08-01 |  67000 |
|         10 | Mia       | Harris   | Finance    | 2019-05-14 |  95000 |
|         11 | Ethan     | Martin   | Finance    | 2022-04-25 |  81000 |
|         12 | Alexander | Clark    | Sales      | 2024-09-30 |  62000 |
+------------+-----------+----------+------------+------------+--------+

----------------------------------------------------------------------------------------------------------

--QUERIES:

--1. Retrieve all orders and customer details where order exist.

SELECT 
    o.OrderId, 
    o.OrderDate, 
    o.TotalAmount, 
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    c.Email
FROM orders o
INNER JOIN customers c ON o.CustomerId = c.CustomerId;
+---------+------------+-------------+------------+-----------+----------+-----------------------+
| OrderId | OrderDate  | TotalAmount | CustomerId | FirstName | LastName | Email                 |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
|     101 | 2023-07-01 |       150.5 |          1 | John      | Doe      | john.doe@gmail.com    |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@gmail.com  |
|     103 | 2023-08-15 |          45 |          1 | John      | Doe      | john.doe@gmail.com    |
|     104 | 2023-09-12 |       320.1 |          3 | Robert    | Johnson  | robert.j@gmail.com    |
|     105 | 2023-10-05 |       89.95 |          4 | Emily     | Davis    | emily.davis@yahoo.com |
|     106 | 2023-11-20 |        12.5 |          3 | Robert    | Johnson  | robert.j@gmail.com    |
+---------+------------+-------------+------------+-----------+----------+-----------------------+

--2. Retrieve all the customer and their corresponding orders.

SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    o.OrderId, 
    o.OrderDate, 
    o.TotalAmount
FROM customers c
LEFT JOIN orders o ON c.CustomerId = o.CustomerId;
+------------+-----------+----------+---------+------------+-------------+
| CustomerId | FirstName | LastName | OrderId | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     103 | 2023-08-15 |          45 |
|          1 | John      | Doe      |     101 | 2023-07-01 |       150.5 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Johnson  |     106 | 2023-11-20 |        12.5 |
|          3 | Robert    | Johnson  |     104 | 2023-09-12 |       320.1 |
|          4 | Emily     | Davis    |     105 | 2023-10-05 |       89.95 |
|          5 | Michael   | Brown    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+

--3. Retrieve all the orders and their corresponding customers.

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM customers c
RIGHT JOIN orders o on c.CustomerId = o.CustomerId;
+---------+------------+-------------+------------+-----------+----------+-----------------------+
| OrderID | OrderDate  | TotalAmount | CustomerId | FirstName | LastName | Email                 |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
|     101 | 2023-07-01 |       150.5 |          1 | John      | Doe      | john.doe@gmail.com    |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@gmail.com  |
|     103 | 2023-08-15 |          45 |          1 | John      | Doe      | john.doe@gmail.com    |
|     104 | 2023-09-12 |       320.1 |          3 | Robert    | Johnson  | robert.j@gmail.com    |
|     105 | 2023-10-05 |       89.95 |          4 | Emily     | Davis    | emily.davis@yahoo.com |
|     106 | 2023-11-20 |        12.5 |          3 | Robert    | Johnson  | robert.j@gmail.com    |
+---------+------------+-------------+------------+-----------+----------+-----------------------+

--4. Retrieve all orders and customers, regardless of matching.
SELECT c.CustomerId, c.FirstName, c.LastName, o.OrderId, o.OrderDate, o.TotalAmount
FROM customers c
LEFT JOIN orders o ON c.CustomerId = o.CustomerId
UNION
SELECT c.CustomerId, c.FirstName, c.LastName, o.OrderId, o.OrderDate, o.TotalAmount
FROM customers c
RIGHT JOIN orders o ON c.CustomerId = o.CustomerId;
+------------+-----------+----------+---------+------------+-------------+
| CustomerId | FirstName | LastName | OrderId | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     103 | 2023-08-15 |          45 |
|          1 | John      | Doe      |     101 | 2023-07-01 |       150.5 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Johnson  |     106 | 2023-11-20 |        12.5 |
|          3 | Robert    | Johnson  |     104 | 2023-09-12 |       320.1 |
|          4 | Emily     | Davis    |     105 | 2023-10-05 |       89.95 |
|          5 | Michael   | Brown    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+

--5. Subquery to find the customers who have placed order worth more than the average amount.
SELECT DISTINCT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    c.Email
FROM customers c
INNER JOIN orders o ON c.CustomerId = o.CustomerId
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM orders);
+------------+-----------+----------+----------------------+
| CustomerId | FirstName | LastName | Email                |
+------------+-----------+----------+----------------------+
|          1 | John      | Doe      | john.doe@gmail.com   |
|          2 | Jane      | Smith    | jane.smith@gmail.com |
|          3 | Robert    | Johnson  | robert.j@gmail.com   |
+------------+-----------+----------+----------------------+

--6. Subquery to find employees with salaries above the average.
SELECT 
    FirstName,
    LastName,
    Department,
    Salary
FROM employees
WHERE Salary > (SELECT AVG(Salary) FROM employees);
+-----------+----------+------------+--------+
| FirstName | LastName | Department | Salary |
+-----------+----------+------------+--------+
| David     | Miller   | IT         |  85000 |
| Sophia    | Wilson   | IT         |  92000 |
| Isabella  | Jackson  | Marketing  |  72000 |
| Mia       | Harris   | Finance    |  95000 |
| Ethan     | Martin   | Finance    |  81000 |
+-----------+----------+------------+--------+

--7. Extract year and month from OrderDate.
SELECT 
    OrderId,
    OrderDate,
    YEAR(OrderDate) as OrderYear,
    MONTH(OrderDate) as OrderMonth
FROM orders;
+---------+------------+-----------+------------+
| OrderId | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-08-15 |      2023 |          8 |
|     104 | 2023-09-12 |      2023 |          9 |
|     105 | 2023-10-05 |      2023 |         10 |
|     106 | 2023-11-20 |      2023 |         11 |
+---------+------------+-----------+------------+

--8. Calculate the difference in days between two dates.
SELECT 
    OrderId,
    OrderDate,
    CURRENT_DATE() as CurrentSystemDate,
    DATEDIFF(CURRENT_DATE(), OrderDate) as DayElapsed
FROM orders;
+---------+------------+-------------------+------------+
| OrderId | OrderDate  | CurrentSystemDate | DayElapsed |
+---------+------------+-------------------+------------+
|     101 | 2023-07-01 | 2026-10-08        |       1195 |
|     102 | 2023-07-03 | 2026-10-08        |       1193 |
|     103 | 2023-08-15 | 2026-10-08        |       1150 |
|     104 | 2023-09-12 | 2026-10-08        |       1122 |
|     105 | 2023-10-05 | 2026-10-08        |       1099 |
|     106 | 2023-11-20 | 2026-10-08        |       1053 |
+---------+------------+-------------------+------------+

--9. Format the OrderDate into a more readable format like (DD-MM-YYYY).

SELECT
    OrderId,
    OrderDate,
    DATE_FORMAT(OrderDate, "%d-%m-%Y") AS FormattedDate
FROM Orders;
+---------+------------+---------------+
| OrderId | OrderDate  | FormattedDate |
+---------+------------+---------------+
|     101 | 2023-07-01 | 01-07-2023    |
|     102 | 2023-07-03 | 03-07-2023    |
|     103 | 2023-08-15 | 15-08-2023    |
|     104 | 2023-09-12 | 12-09-2023    |
|     105 | 2023-10-05 | 05-10-2023    |
|     106 | 2023-11-20 | 20-11-2023    |
+---------+------------+---------------+

--10. Concatenate FirstName and LastName to form a fullname.
SELECT 
    FirstName,
    LastName,
    CONCAT(FirstName ," ", LastName) as FullName
From Customers;
+-----------+----------+----------------+
| FirstName | LastName | FullName       |
+-----------+----------+----------------+
| John      | Doe      | John Doe       |
| Jane      | Smith    | Jane Smith     |
| Robert    | Johnson  | Robert Johnson |
| Emily     | Davis    | Emily Davis    |
| Michael   | Brown    | Michael Brown  |
+-----------+----------+----------------+

--11. Replace part of a string eg("John" to "Johnathan").
    --Temporary Change:
SELECT 
    FirstName,
    REPLACE(FirstName , "John", "Johnathan") AS UpdatedFirstName,
    LastName
FROM customers;
    --For permenant Change:
UPDATE CUSTOMER 
SET FirstName = REPLACE(FirstName, "John", "Johnathan")    
WHERE FirstName LIKE "%John%";
+-----------+------------------+----------+
| FirstName | UpdatedFirstName | LastName |
+-----------+------------------+----------+
| John      | Johnathan        | Doe      |
| Jane      | Jane             | Smith    |
| Robert    | Robert           | Johnson  |
| Emily     | Emily            | Davis    |
| Michael   | Michael          | Brown    |
+-----------+------------------+----------+

--12. Convert FirstName to uppercase and LastName to lowercase.
SELECT
    FirstName,
    UPPER(FirstName) as UpperFirstName,
    LastName,
    LOWER(LastName) as lowerLastName
FROM customers;
+-----------+----------------+----------+---------------+
| FirstName | UpperFirstName | LastName | lowerLastName |
+-----------+----------------+----------+---------------+
| John      | JOHN           | Doe      | doe           |
| Jane      | JANE           | Smith    | smith         |
| Robert    | ROBERT         | Johnson  | johnson       |
| Emily     | EMILY          | Davis    | davis         |
| Michael   | MICHAEL        | Brown    | brown         |
+-----------+----------------+----------+---------------+

--13. Trim extra spaces from email id.
SELECT 
    Email,
    TRIM(Email) AS CleanedEmail
FROM customers;
+-----------------------+-----------------------+
| Email                 | CleanedEmail          |
+-----------------------+-----------------------+
| john.doe@gmail.com    | john.doe@gmail.com    |
| jane.smith@gmail.com  | jane.smith@gmail.com  |
| robert.j@gmail.com    | robert.j@gmail.com    |
| emily.davis@yahoo.com | emily.davis@yahoo.com |
| mbrown@outlook.com    | mbrown@outlook.com    |
+-----------------------+-----------------------+

--14. Calculate the running total of TotalAmount for each order.
SELECT 
    OrderId, 
    CustomerId, 
    OrderDate, 
    TotalAmount,
    SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderId) AS RunningTotal
FROM orders;
+---------+------------+------------+-------------+-------------------+
| OrderId | CustomerId | OrderDate  | TotalAmount | RunningTotal      |
+---------+------------+------------+-------------+-------------------+
|     101 |          1 | 2023-07-01 |       150.5 |             150.5 |
|     102 |          2 | 2023-07-03 |      200.75 |            351.25 |
|     103 |          1 | 2023-08-15 |          45 |            396.25 |
|     104 |          3 | 2023-09-12 |       320.1 | 716.3500061035156 |
|     105 |          4 | 2023-10-05 |       89.95 | 806.3000030517578 |
|     106 |          3 | 2023-11-20 |        12.5 | 818.8000030517578 |
+---------+------------+------------+-------------+-------------------+

--15. Rank order based on their TotalAmount using the RANK().
SELECT
    OrderId,
    CustomerId,
    OrderDate,
    TotalAmount,
RANK() OVER (ORDER BY TotalAmount DESC) as OrderRank
From orders;
+---------+------------+------------+-------------+-----------+
| OrderId | CustomerId | OrderDate  | TotalAmount | OrderRank |
+---------+------------+------------+-------------+-----------+
|     104 |          3 | 2023-09-12 |       320.1 |         1 |
|     102 |          2 | 2023-07-03 |      200.75 |         2 |
|     101 |          1 | 2023-07-01 |       150.5 |         3 |
|     105 |          4 | 2023-10-05 |       89.95 |         4 |
|     103 |          1 | 2023-08-15 |          45 |         5 |
|     106 |          3 | 2023-11-20 |        12.5 |         6 |
+---------+------------+------------+-------------+-----------+

--16. Assign discount based on TotalAmount in orders. eg(>1000 : 10% off, >500: 5% off)
SELECT 
    OrderId,
    CustomerId,
    TotalAmount,
    Case
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.90
        WHEN TotalAmount > 500 THEN TotalAmount * 0.95
        WHEN TotalAmount > 200 THEN TotalAmount * 0.98
        ELSE TotalAmount
    END AS FinalPriceedAmount
FROM orders;
+---------+------------+-------------+--------------------+
| OrderId | CustomerId | TotalAmount | FinalPriceedAmount |
+---------+------------+-------------+--------------------+
|     101 |          1 |       150.5 |              150.5 |
|     102 |          2 |      200.75 | 196.73499999999999 |
|     103 |          1 |          45 |                 45 |
|     104 |          3 |       320.1 |  313.6980059814453 |
|     105 |          4 |       89.95 |  89.94999694824219 |
|     106 |          3 |        12.5 |               12.5 |
+---------+------------+-------------+--------------------+

--17. Categorize employees salary as high, medium and low.
SELECT 
    EmployeeId,
    FirstName,
    LastName,
    Department,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN "High"
        WHEN Salary >= 65000 THEN "Medium"
        ELSE "LOW"
    END AS SalaryCategory
FROM employees;
+------------+-----------+----------+------------+--------+----------------+
| EmployeeId | FirstName | LastName | Department | Salary | SalaryCategory |
+------------+-----------+----------+------------+--------+----------------+
|          1 | Mark      | Johnson  | Sales      |  50000 | LOW            |
|          2 | Susan     | Lee      | HR         |  55000 | LOW            |
|          3 | David     | Miller   | IT         |  85000 | High           |
|          4 | Sophia    | Wilson   | IT         |  92000 | High           |
|          5 | James     | Taylor   | IT         |  60000 | LOW            |
|          6 | Olivia    | Anderson | HR         |  68000 | Medium         |
|          7 | Daniel    | Thomas   | HR         |  55000 | LOW            |
|          8 | Isabella  | Jackson  | Marketing  |  72000 | Medium         |
|          9 | Lucas     | White    | Marketing  |  67000 | Medium         |
|         10 | Mia       | Harris   | Finance    |  95000 | High           |
|         11 | Ethan     | Martin   | Finance    |  81000 | High           |
|         12 | Alexander | Clark    | Sales      |  62000 | LOW            |
+------------+-----------+----------+------------+--------+----------------+