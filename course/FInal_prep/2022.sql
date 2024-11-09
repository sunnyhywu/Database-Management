show databases;

-- Create Air database\
CREATE DATABASE Air;

USE Air;

CREATE TABLE
    airline (
        ICode CHAR(3) PRIMARY KEY,
        lName VARCHAR(50),
        country VARCHAR(50)
    );

CREATE TABLE
    flight (
        ICode CHAR(3),
        flightNumber INT,
        fromAirport CHAR(3),
        toAirport CHAR(3),
        lengthHours INT,
        PRIMARY KEY (ICode, flightNumber)
    );

CREATE TABLE
    airport (
        aCode CHAR(3) PRIMARY KEY,
        aName VARCHAR(50),
        country VARCHAR(50),
        city VARCHAR(50)
    );

CREATE TABLE
    schedule (
        ICode CHAR(3),
        flightNumber INT,
        date DATE,
        time TIME,
        capacity INT,
        PRIMARY KEY (ICode, flightNumber, date, time)
    );

CREATE TABLE
    booked (
        customer VARCHAR(50),
        ICode CHAR(3),
        flightNumber INT,
        date DATE,
        time TIME,
        PRIMARY KEY (customer, ICode, flightNumber, date, time)
    );

-- Insert data into airline table
INSERT INTO
    airline (ICode, lName, country)
VALUES
    ('AE', 'American Airlines', 'USA'),
    ('DAL', 'Delta Airlines', 'USA'),
    ('AC', 'Air Canada', 'Canada'),
    ('DHL', 'Lufthansa', 'Germany');

-- Insert data into flight table
INSERT INTO
    flight (
        ICode,
        flightNumber,
        fromAirport,
        toAirport,
        lengthHours
    )
VALUES
    ('AE', 367, 'JFK', 'DEL', 8),
    ('AC', 555, 'ORD', 'YYZ', 2),
    ('AC', 73, 'YYZ', 'DEL', 16);

-- Insert data into airport table
INSERT INTO
    airport (aCode, aName, country, city)
VALUES
    (
        'JFK',
        'John F Kennedy International',
        'USA',
        'New York'
    ),
    (
        'DEL',
        'Indira Gandhi International Airport',
        'India',
        'Delhi'
    ),
    (
        'ORD',
        'Chicago O\'Hare International',
        'USA',
        'Chicago'
    ),
    (
        'YYZ',
        'Lester B. Pearson International',
        'Canada',
        'Toronto'
    );

-- Insert data into schedule table
INSERT INTO
    schedule (ICode, flightNumber, date, time, capacity)
VALUES
    ('AE', 367, '2013-05-04', '12:40', 245),
    ('AC', 555, '2013-07-07', '02:00', 80),
    ('AC', 73, '2013-08-04', '04:00', 100),
    ('AC', 73, '2013-08-09', '04:00', 100);

-- Insert data into booked table
INSERT INTO
    booked (customer, ICode, flightNumber, date, time)
VALUES
    (
        'Peter Fullbright',
        'AE',
        367,
        '2013-05-04',
        '12:40'
    ),
    ('Alice Bobsen', 'AC', 555, '2013-07-07', '02:00');

SHOW TABLES;

-- drop database Air;
SELECT
    *
FROM
    airline;

SELECT
    *
FROM
    locations;

SELECT
    *
FROM
    employees;

/* 1. Write a query to display the first name and last name of all employees who both have "an" in their name. (5%) */
SELECT
    First_name,
    Last_name
FROM
    employees
where
    first_name LIKE "%an%"
    AND last_name LIKE "%an%";

/* 2. Write a query to get employee ID, the names (first_name, last_name), job ID, email, phone number and hire date of employees 
working the department 100 and administrated by Nancy Greenberg. (5%)*/
SELECT
    employee_ID,
    CONCAT (CONCAT (First_name, ' '), Last_name),
    Job_ID,
    email,
    phone_number,
    hire_date
FROM
    employees
where
    department_ID = 100
    AND manager_ID = (
        SELECT
            employee_ID
        FROM
            employees
        WHERE
            last_name = ' Greenberg'
            AND first_name = 'Nancy'
    );

/* 3. As above question, write a query to get average salary (name "Average_Salary")
and number of employees (name "How_Many_Employees") whose hire date before 1987-629. (6%)*/
SELECT
    AVG(salary) as avg_salary,
    COUNT(DISTINCT employee_ID)
FROM
    employees
where
    hire_date < '1987-6-29';

/*4. Write a query to find the manager ID and sum the salary for employees that administrated 
by the same manager (name " Sum_Salary "), then display by descending Sum_Salary (6%)*/
SELECT
    manager_ID,
    sum(salary) as sum_salary
FROM
    employees
WHERE
    manager_id is not null
GROUP BY
    manager_ID
ORDER BY
    sum_salary desc;

/*5. Write a query to display employee ID and the names (first_name, last_name), 
salary and bonus (7.5% of salary) of all employees. (6%)*/
SELECT
    employee_id,
    CONCAT (CONCAT (first_name, ' '), last_name),
    salary,
    salary * 0.075 as bonus
from
    employees;

-- Air databse --
/*1. Write an SQL that returns the names of all airlines from Germany. (6%)*/
SELECT
    lNAME
FROM
    airline
WHERE
    country = 'Germany';

/*2.Write an SQL that returns cities from the USA that have an airport. (6%)*/
SELECT
    city
FROM
    airport
WHERE
    country = 'USA';

/*3.Write an SQL that returns booked all information, in which date and time are combined as a new attribute called ‘datetime’. 
The following table is the result. (6%)*/
SELECT
    customer,
    ICode,
    flightNumber,
    CONCAT (CONCAT (date, '-'), time) as datetime
FROM
    booked;

/*4.Write an SQL that returns the total capacity of all scheduled flights per airline. 
Return pairs of airline codes (lCode) and total capacity. For example, the following table is the result for the sample data. (6%)*/
SELECT
    ICode,
    sum(capacity) as total_capacity
FROM
    schedule
GROUP BY
    ICode;

/*5.Write an SQL that returns the names of all customers together with the destination city of flights they have booked. (8%)*/
SELECT
    customer,
    city as desination_city
from
    booked
    NATURAL JOIN flight
    JOIN airport On (toAirport = aCode);

/*6.Write an SQL query that returns airline code (lCode) of flights that are scheduled between 01:00 and 05:00. (6%)*/
SELECT DISTINCT
    ICode
FROM
    schedule
WHERE
    time BETWEEN '01;00' AND '05:00';

/*7.Write an SQL query that returns the airline name (lName) and flight number for flights that are less than 6 hours long. (6%)*/
SELECT
    lName,
    flightNumber
FROM
    airline
    NATURAL JOIN flight f
WHERE
    lengthHours < '6';

/*8. Write an SQL query that returns flights (airline code and flight number) that start from an airport in USA 
and land in an airport in India. (8%)*/
SELECT
    ICode,
    flightNumber
FROM
    flight f
    JOIN airport a1 on f.fromAirport = a1.aCode
    JOIN airport a2 on f.toAirport = a2.aCode
WHERE
    a1.country = 'USA'
    AND a2.country = 'India';

/*9. Write an SQL statement that deletes all flights from JFK to DEL*/
DELETE FROM flight
WHERE
    fromAirport = 'JFK'
    AND toAirport = 'DEL';

/*10.Write an SQL that returns all records from the Customers table, even if there are no matches in the Orders table. 
Note that the resulting table only comprises customer name and order id, 
and soring according to customer name in descending order. (8%)*/
SELECT
    C.cutomername,
    O.orderId
FROM
    Customer C
    LEFT JOIN Order O on C.customerID = O.cusotmerID
ORDER BY
    customername DESC;

/*11.In the SQL file, no primary key is assigned for customers table. 
Use alter command to add primary key for the table.*/
ALTER TABLE Customer ADD (primary key (CustomerID));

-- finalAir 
SELECT
    *
FROM
    flight
WHERE
    lengthHours > 6;

SELECT DISTINCT
    (flightNumber)
FROM
    schedule
WHERE
    time BETWEEN "01:00" and "05:00";

UPDATE customer
set
    country = 'Taiwan'
WHERE
    ID = 3;

SELECT DISTINCT
    (ICode),
    SUM(capacity) as total_capacity
FROM
    schedule
GROUP BY
    ICode;

SELECT
    *
FROM
    customers
WHERE
    EXISTS (
        SELECT
            *
        FROM
            order
        WHERE
            customers.CustomerID = orders.CustomerID
    );

SELECT
    ICode,
    lengthHours,
    flightNumber
FROM
    flight
    JOIN airport a1 on (fromAirport = a1.aCode)
    JOIN airport a2 ON (toAirport = a1.aCode)
WHERE
    a1.aCode = 'Canada'
    AND a2.aCode = 'India';



