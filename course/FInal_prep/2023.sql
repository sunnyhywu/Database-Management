show DATABASES;

use retail;

SHOW TABLES;

select
    *
from
    productlines;

SELECT
    *
FROM
    products;

SELECT
    *
FROM
    customers;

SELECT
    *
FROM
    orders;

SELECT
    *
FROM
    employees;

SELECT
    *
from
    payments;

SELECT
    *
FROM
    orderdetails;

/*1. List the product lines whose text description contains 'Cars'. 
You can reference the result below to write the SQL. (7%)*/
SELECT
    productLine
from
    productlines
where
    textDescription LIKE '%Cars%';

/*2. What is the minimum payment received? (5%)*/
SELECT
    MIN(amount)
FROM
    payments;

/* 3. Report the name and city of customers who don't have sales representatives?
You can reference the result below to write the SQL. (7%)*/
SELECT
    customerName,
    city
FROM
    customers
where
    salesRepEmployeeNumber is NULL;

/* 4.Report the account representative, 
where the name is presented as “First_Name, Last_Name”, for each customer. (10%)*/;

SELECT
    CONCAT (CONCAT (contactFirstName, ' '), contactLastName)
FROM
    customers;

/*5.Report the number of orders 'Shipped' for each customer and sort by the number of shipped orders in descending order. (10%)*/
SELECT
    customerNumber,
    count(orderNumber) as numofOderShipped
from
    customers
    NATURAL JOIN orders
where
    status = 'Shipped'
group by
    customerNumber
order by
    numofOderShipped DESC;

/* 6. List all customers and their sales representatives (last name and first name) even if they don't have a sales representative. (9%) */
SELECT
    C.customerNumber,
    E.lastName,
    E.firstName
FROM
    customers C
    LEFT JOIN employees E ON C.salesRepEmployeeNumber = E.employeeNumber;

/* 7. List the employee names of those who report to Mary Patterson, where the name is the presented as “Last_Name, First_Name”. 
You can reference the result below to write the SQL. (11%)*/
SELECT
    CONCAT (lastName, ' ', firstName) AS EmployeeName
FROM
    employees E
WHERE
    reportsTo = (
        SELECT
            employeeNumber
        from
            employees
        WHERE
            lastName = 'Patterson'
            AND firstName = 'Mary'
    );

/*8. List the customer’s name, their credit limit, and the total amount of payment of each customer 
whose total amount of payment is larger than their credit limit. (11%)*/
SELECT
    customerName,
    creditLimit,
    SUM(amount) AS TotalAmount
FROM
    customers
    NATURAL JOIN payments
GROUP BY
    customerName,
    creditLimit
HAVING
    TotalAmount > creditLimit;

select
    customerName,
    creditLimit,
    sum(amount) as TotalAmount
from
    customers
    NATURAL JOIN payments
group by
    `customerName`
HAVING
    creditLimit < sum(amount);

/*9. Report the product that their quantity of stock is minimum. (8%)*/
select
    productCode,
    productName
FROM
    products
where
    quantityInStock = (
        SELECT
            MIN(quantityInStock)
        from
            products
    );

/*10. List products, including their product code and the order quantity, 
whose order quantity is between 900 and 1000 in descending order. (11%)*/
SELECT
    productCode,
    SUM(quantityOrdered) AS order_quantity
FROM
    products
    NATURAL JOIN orders
    NATURAL JOIN orderdetails
GROUP BY
    productCode
having
    order_quantity BETWEEN 900 AND 1000
ORDER BY
    order_quantity DESC;

/*11. Report the product and their remaining stock (stock-order) whose remaining stock is less than zero or null.
You can reference the result below to write the SQL. (11%)*/
SELECT
    productName,
    quantityInStock - SUM(quantityOrdered) as remaining_stock
FROM
    products p
    LEFT JOIN orderdetails o on p.productCode = o.productCode
GROUP BY
    p.productCode
HAVING
    remaining_stock <= 0
    or remaining_stock is null;