SHOW DATABASES;

use hw5;

SHOW TABLES;

DESC CUSTOMER;

SELECT
    *
FROM
    CUSTOMER;

DESC INVOICE;

SELECT
    *
FROM
    INVOICE;

DESC LINE;

DESC VENDOR;

DESC PRODUCT;

/* Probelm 1 : count the number of INVOICE table */
SELECT
    COUNT(*)
FROM
    INVOICE;

/* Probelm 2 : count the number of customers with a customer balance over $500 */
SELECT
    COUNT(*)
FROM
    CUSTOMER
WHERE
    CUS_BALANCE > 500;

/* Probelm 3 : Generate a listing of all purchases made by the customers, 
using the output shown in Figure P6.1 as your guide. 
(Hint: Use the ORDER BY clause to order the resulting rows as shown in Figure P6.1) */
SELECT
    C.CUS_CODE,
    I.INV_NUMBER,
    date_format(I.INV_DATE, '%d-%b-%y') AS INV_DATE,
    P.P_DESCRIPT,
    L.LINE_UNITS,
    L.LINE_PRICE
FROM
    CUSTOMER C
    NATURAL JOIN INVOICE I
    NATURAL JOIN LINE L
    NATURAL JOIN PRODUCT P
ORDER BY
    C.CUS_CODE,INV_NUMBER, P.P_DESCRIPT;

/* Probelm 4 : Use a query to show the invoices and invoice totals as shown in Figure P6.2. (Hint:
Group by the CUS_CODE.)The Invoice Total is the sum of the product purchases in the LINE that corresponds to the INVOICE.*/
SELECT
    C.CUS_CODE,
    I.INV_NUMBER,
    SUM(L.LINE_PRICE * L.LINE_UNITs) AS INVOICE_TOTAL
FROM
    CUSTOMER C
    NATURAL JOIN INVOICE I
    NATURAL JOIN LINE L
GROUP BY
    C.CUS_CODE,
    I.INV_NUMBER;

/* Probelm 5 : Use a query to show the summary of customer purchases as shown in Figure P6.3. */
SELECT
    C.CUS_CODE,
    C.CUS_BALANCE,
    SUM(L.LINE_PRICE * L.LINE_UNITS) AS TOTAL_PURCHASE
FROM
    CUSTOMER C
    NATURAL JOIN INVOICE I
    NATURAL JOIN LINE L
GROUP BY
    C.CUS_CODE;

/* Probelm 6 : Modify the query in Problem 5 to include the number of individual product purchases made by each customer. 
(In other words, if the customer’s invoice is based on three products, one per LINE_NUMBER, you would count three product purchases. 
If you examine the original invoice data, you will note that customer 10011 generated three invoices, which contained a total of six lines,
each representing a product purchase.) Your output values must match those shown in Figure P6.4. */
SELECT 
    C.CUS_CODE,
    C.CUS_BALANCE,
    SUM(L.LINE_UNITS * L.LINE_PRICE) AS Total_Purchases,
    COUNT(L.LINE_NUMBER) AS Number_of_Purchases
FROM 
    CUSTOMER C
JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE
JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY 
    C.CUS_CODE, C.CUS_BALANCE
ORDER BY 
    C.CUS_CODE;

/* Probelm 7 : Create a query to produce the total purchase per invoice, generating the results shown in Figure P6.5. 
The Invoice Total is the sum of the product purchases in the LINE that corresponds to the INVOICE. */
SELECT
    I.INV_NUMBER,
    SUM(L.LINE_PRICE * L.LINE_UNITS) AS INVOICE_TOTAL
FROM
    INVOICE I
    NATURAL JOIN LINE L
GROUP BY
    I.INV_NUMBER;  




