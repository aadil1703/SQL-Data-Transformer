# 🗄️ SQL Joins, Subqueries & Advanced Queries

A SQL practice project designed to strengthen my understanding of **intermediate to advanced SQL concepts** using multiple related tables and practical queries.

The project focuses on retrieving, combining, transforming, filtering, and analyzing data using **JOINs, Subqueries, Date Functions, String Functions, CASE Statements, and Window Functions**.

---

## 📌 Project Overview

This project uses three main tables:

- **Customers** — stores customer information.
- **Orders** — stores customer orders and transaction amounts.
- **Employees** — stores employee information, departments, hiring dates, and salaries.

The database is then queried to solve different real-world style SQL problems.

---

## 🗂️ Database Structure

### 👥 Customers

| Column | Data Type | Description |
|---|---|---|
| CustomerId | INT | Primary key |
| FirstName | VARCHAR | Customer first name |
| LastName | VARCHAR | Customer last name |
| Email | VARCHAR | Customer email |
| RegistrationDate | DATE | Customer registration date |

### 🛒 Orders

| Column | Data Type | Description |
|---|---|---|
| OrderId | INT | Primary key |
| CustomerID | INT | Customer reference |
| OrderDate | DATE | Date of order |
| TotalAmount | FLOAT | Total order amount |

### 👨‍💼 Employees

| Column | Data Type | Description |
|---|---|---|
| EmployeeID | INT | Primary key |
| FirstName | VARCHAR | Employee first name |
| LastName | VARCHAR | Employee last name |
| Department | VARCHAR | Employee department |
| HireDate | DATE | Employee hiring date |
| Salary | FLOAT | Employee salary |

---

## 🧠 SQL Concepts Practiced

### 1. 🔗 INNER JOIN

Used to retrieve records where matching data exists in both tables.

Example:

```sql
SELECT 
    o.OrderId,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM orders o
INNER JOIN customers c 
    ON o.CustomerId = c.CustomerId;
```

This connects orders with their corresponding customer information.

---

### 2. ⬅️ LEFT JOIN

Used to retrieve **all customers**, including customers who have not placed any orders.

```sql
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    o.OrderId,
    o.OrderDate,
    o.TotalAmount
FROM customers c
LEFT JOIN orders o 
    ON c.CustomerId = o.CustomerId;
```

This demonstrates how unmatched records produce `NULL` values.

---

### 3. ➡️ RIGHT JOIN

Used to retrieve all orders along with their corresponding customers.

```sql
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM customers c
RIGHT JOIN orders o 
    ON c.CustomerId = o.CustomerId;
```

---

### 4. 🔄 FULL OUTER JOIN Concept

MySQL does not directly support `FULL OUTER JOIN`, so I simulated it using:

- `LEFT JOIN`
- `RIGHT JOIN`
- `UNION`

```sql
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    o.OrderId,
    o.OrderDate,
    o.TotalAmount
FROM customers c
LEFT JOIN orders o 
    ON c.CustomerId = o.CustomerId

UNION

SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    o.OrderId,
    o.OrderDate,
    o.TotalAmount
FROM customers c
RIGHT JOIN orders o 
    ON c.CustomerId = o.CustomerId;
```

---

## 🔍 Subqueries

The project also demonstrates using a query inside another query.

### Customers with orders above average

```sql
SELECT DISTINCT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM customers c
INNER JOIN orders o 
    ON c.CustomerId = o.CustomerId
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount) 
    FROM orders
);
```

### Employees earning above average salary

```sql
SELECT 
    FirstName,
    LastName,
    Department,
    Salary
FROM employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM employees
);
```

These queries helped me understand how **aggregate functions and subqueries can be combined with filtering and joins**.

---

## 📅 Date Functions

Practiced MySQL date functions such as:

- `YEAR()`
- `MONTH()`
- `CURRENT_DATE()`
- `DATEDIFF()`
- `DATE_FORMAT()`

### Extract year and month

```sql
SELECT 
    OrderId,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM orders;
```

### Calculate elapsed days

```sql
SELECT 
    OrderId,
    OrderDate,
    CURRENT_DATE() AS CurrentSystemDate,
    DATEDIFF(CURRENT_DATE(), OrderDate) AS DayElapsed
FROM orders;
```

### Format dates

```sql
SELECT
    OrderId,
    OrderDate,
    DATE_FORMAT(OrderDate, "%d-%m-%Y") AS FormattedDate
FROM orders;
```

---

## 🔤 String Functions

Practiced SQL string manipulation using:

- `CONCAT()`
- `REPLACE()`
- `UPPER()`
- `LOWER()`
- `TRIM()`

### Concatenate names

```sql
SELECT 
    FirstName,
    LastName,
    CONCAT(FirstName, " ", LastName) AS FullName
FROM Customers;
```

### Replace text

```sql
SELECT 
    FirstName,
    REPLACE(FirstName, "John", "Johnathan") AS UpdatedFirstName,
    LastName
FROM customers;
```

### Change letter case

```sql
SELECT
    FirstName,
    UPPER(FirstName) AS UpperFirstName,
    LastName,
    LOWER(LastName) AS LowerLastName
FROM customers;
```

### Remove unnecessary spaces

```sql
SELECT 
    Email,
    TRIM(Email) AS CleanedEmail
FROM customers;
```

---

## 📊 Window Functions

One of the major concepts practiced in this project is **SQL Window Functions**.

### Running Total

```sql
SELECT 
    OrderId,
    CustomerId,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderId
    ) AS RunningTotal
FROM orders;
```

This calculates a cumulative total as the orders progress.

### Ranking Orders

```sql
SELECT
    OrderId,
    CustomerId,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM orders;
```

This ranks orders based on their total amount.

---

## 🧮 CASE Statements

Used `CASE` statements to create conditional logic directly inside SQL queries.

### Order Discount

```sql
SELECT 
    OrderId,
    CustomerId,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.90
        WHEN TotalAmount > 500 THEN TotalAmount * 0.95
        WHEN TotalAmount > 200 THEN TotalAmount * 0.98
        ELSE TotalAmount
    END AS FinalPrice
FROM orders;
```

### Employee Salary Categories

```sql
SELECT 
    EmployeeId,
    FirstName,
    LastName,
    Department,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN "High"
        WHEN Salary >= 65000 THEN "Medium"
        ELSE "Low"
    END AS SalaryCategory
FROM employees;
```

This demonstrates how SQL can be used to create **business logic and classifications**.

---

## 📚 Topics Covered

| Concept | Practiced |
|---|:---:|
| CREATE TABLE | ✅ |
| INSERT INTO | ✅ |
| SELECT | ✅ |
| INNER JOIN | ✅ |
| LEFT JOIN | ✅ |
| RIGHT JOIN | ✅ |
| FULL OUTER JOIN concept | ✅ |
| UNION | ✅ |
| Subqueries | ✅ |
| Aggregate Functions | ✅ |
| Date Functions | ✅ |
| String Functions | ✅ |
| CASE Statements | ✅ |
| Window Functions | ✅ |
| Running Totals | ✅ |
| RANK() | ✅ |

---

## 🎯 Learning Objectives

Through this project, I practiced how to:

- Combine data from multiple tables.
- Understand different types of SQL JOINs.
- Work with subqueries.
- Use aggregate functions inside queries.
- Perform date calculations and formatting.
- Manipulate strings using SQL functions.
- Apply conditional logic using `CASE`.
- Calculate running totals.
- Rank records using window functions.
- Write SQL queries that resemble real-world business problems.

---

## 🛠️ Technology Used

- **MySQL**
- **SQL**
- MySQL Workbench / SQL-compatible environment

---

## 🚀 Future Improvements

Possible extensions for this project:

- Add `GROUP BY` and `HAVING` based analysis.
- Add more complex multi-table JOINs.
- Practice correlated subqueries.
- Add `CTE (WITH)` queries.
- Explore `ROW_NUMBER()`, `DENSE_RANK()`, `LAG()` and `LEAD()`.
- Add indexes and explore query performance.
- Create a larger and more realistic dataset.
- Build analytical reports from the database.

---

## 👨‍💻 About This Project

This is my **second SQL project**, created as part of my journey toward becoming stronger in **Data Analytics, SQL, and AI/ML**.

The main goal was not only to write SQL queries, but to understand **how and why different SQL concepts are used to solve data problems**.

---

⭐ If you find this project useful, feel free to explore the SQL queries and experiment with them!