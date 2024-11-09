use w3schools;

SELECT
    *
FROM
    Products;

/*1. Find products that have never been ordered.*/
SELECT
    ProductID,
    ProductName
FROM
    Products
WHERE
    NOT EXISTS (
        SELECT
            ProductID
        FROM
            OrderDetails
    );


/*2. Find the categories with more than 5 products. (The output table should comprise CategoryID and its associated product counts)*/
SELECT
    CategoryID,
    COUNT(ProductID) as Product_amount
FROM
    Products
GROUP BY
    CategoryID
HAVING
    Product_amount > 5;

/*3. Find the total number of orders and the average quantity ordered for each product.
List the results according to the average quantity in descending order.*/
SELECT
    ProductID,
    COUNT(OrderID) as TotalOrders,
    AVG(Quantity) as AvgQuantity
FROM
    Products
    NATURAL JOIN OrderDetails
GROUP BY
    ProductID
ORDER BY
    AvgQuantity DESC;

/*4. List products (productID and productName) that have a higher price than the average price of all products.*/
SELECT
    ProductID,
    ProductName
FROM
    Products
WHERE
    Price > (
        SELECT
            AVG(Price)
        FROM
            Products
    );

/*5. Find customers who have ordered a product from the 'Beverages' category.*/
SELECT DISTINCT
    C.CustomerID,
    C.CustomerName,
    COUNT(OrderID) as orderTimesCount
FROM
    Customers C
    LEFT JOIN Orders USING (CustomerID)
    LEFT JOIN OrderDetails USING (OrderID)
    LEFT JOIN Products USING (ProductID)
    LEFT JOIN Categories USING (CategoryID)
WHERE
    CategoryName = 'Beverages'
GROUP BY
    CustomerID
ORDER BY
    CustomerID;

/*6. List employee full names in ascending order, in which full name is the concatenation of employee last name and first name. 
For example, if the last name is Lee, first name is Alex, the full name will be “Lee, Alex”.*/
SELECT
    CONCAT (CONCAT (LastName, ', '), FirstName) AS EMP_Fullname
FROM
    Employees
ORDER BY
    EMP_Fullname ASC;

/*7. Find the most popular product category based on the number of orders. 
Please show the ID、Name of the Category and find the most popular product category based on the number of orders. 
(Note that you can use limit clause followed by a number to specify the number of results to return.)*/
SELECT
    CategoryID,
    CategoryName,
    COUNT(DISTINCT (OrderID)) as NumberOfOrders
FROM
    Categories
    NATURAL JOIN Products
    LEFT JOIN OrderDetails USING (ProductID)
GROUP BY
    CategoryID
ORDER BY
    NumberOfOrders DESC
LIMIT
    1;

/* Correct Ans*/
SELECT
    c.CategoryID,
    c.CategoryName,
    COUNT(o.OrderID) AS TotalOrders
FROM
    categories c
    JOIN products p ON c.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN orders o ON od.OrderID = o.OrderID
GROUP BY
    c.CategoryID,
    c.CategoryName
ORDER BY
    TotalOrders DESC
LIMIT
    1;

/*8. Determine the total sales revenue (i.e., total sales amount) of each month and display in the format of year-month (ex:2024-06), 
and the amount of total sales in descending order. 
Please round the total sales to 2 decimals.*/
SELECT
    DATE_FORMAT (OrderDate, '%Y-%m') as YearMonth,
    ROUND(SUM(Quantity * Price), 2) AS TotalSales
FROM
    Orders
    NATURAL JOIN OrderDetails
    NATURAL JOIN Products
GROUP BY
    YearMonth
ORDER BY
    TotalSales DESC;

/*9. Use SQL to list the total sales quantity and total revenue (i.e., total sales amount) for each product, 
include ID and their name and sorted in ascending order by total revenue.*/
SELECT
    ProductID,
    ProductName,
    SUM(Quantity) AS TotalSaleQuantity,
    SUM(Quantity * Price) AS TotalRevenue
FROM
    Products
    NATURAL JOIN OrderDetails
GROUP BY
    ProductID
ORDER BY
    TotalRevenue ASC;

/*10. Retrieve the detailed information (i.e., all information about employee) of the top 3 youngest employees. 
(Note that you can use limit followed by a number to specify the number of results to return)*/
SELECT
    *
FROM
    Employees
ORDER BY
    BirthDate DESC
LIMIT
    3;

/*11. Use SQL to list the order count and customer count for each country.*/
SELECT
    country,
    COUNT(DISTINCT (CustomerID)) as CustomersCount,
    COUNT(OrderID) as OrderAmount
FROM
    Customers
    LEFT JOIN Orders USING (CustomerID)
GROUP BY
    Country
ORDER BY
    Country ASC;

/*12.Query all customers from London and their order counts.*/
SELECT
    CustomerID,
    CustomerName,
    COUNT(OrderID) as orderCounts,
    City
FROM
    Customers
    NATURAL JOIN Orders
GROUP BY
    CustomerID
HAVING
    City = 'London';

/*Correct Ans*/
SELECT
    c.City,
    c.CustomerName as CustomerName,
    COUNT(o.orderID) as OrderCOunt
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'London'
GROUP BY c.City,c.CustomerName;