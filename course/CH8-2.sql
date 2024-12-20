USE dbmscourse;

SELECT P_CODE, DATE_FORMAT(P_INDATE, '%m-%d-%y')  AS DATE FROM PRODUCT;

SELECT P_CODE, DATE_FORMAT(P_INDATE, '%M %d, %Y') AS DATE
FROM PRODUCT;

SELECT EMP_FNAME, EMP_LNAME, EMP_DOB, Year(EMP_DOB) AS YEAR FROM EMPLOYEE WHERE YEAR(EMP_DOB)=1966;

/*Date and Time Functions
All SQL-standard DBMSs support date and time functions. 
All date functions take one parameter of a date or character data type and return a value (character, numeric, or date type).
 Unfortunately, date/time data types are implemented differently by different DBMS vendors.

Date_Format Returns a character string or a formatted string from a date value

Syntax:

DATE_FORMAT(date_value, fmt)

fmt = format used; can be:

%M: name of month

%m: two-digit month number

%b: abbreviated month name

%d: number of day of month

%W: weekday name

%a: abbreviated weekday name

%Y: four-digit year

%y: two-digit year

Examples: Displays the product code and date the product was last received into stock for all products:*/

SELECT P_CODE, DATE_FORMAT(P_INDATE, '%m/%d/%y') AS DATE
FROM PRODUCT;

SELECT P_CODE, DATE_FORMAT(P_INDATE, '%M %d, %Y') AS DATE
FROM PRODUCT;

SELECT EMP_LNAME, EMP_FNAME, EMP_DOB, YEAR(EMP_DOB) AS YEAR
FROM EMPLOYEE
WHERE YEAR(EMP_DOB) = 1966;

SELECT EMP_LNAME, EMP_FNAME, EMP_DOB, MONTH(EMP_DOB) AS MONTH
FROM EMPLOYEE
WHERE MONTH(EMP_DOB) = 11;

SELECT EMP_LNAME, EMP_FNAME, EMP_DOB, DAY(EMP_DOB) AS DAY
FROM EMPLOYEE
WHERE DAY(EMP_DOB) = 14;

/*ADDDATE

Adds a number of days to a date

Syntax:

ADDDATE(date_value, n)

n = number of days

DATE_ADD

Adds a number of days, months, or years to a date.

This is similar to ADDDATE except it is more robust.

It allows the user to specify the date unit to add.

Syntax:

DATE_ADD(date, INTERVAL n unit)

n = number to add

unit = date unit, can be:

DAY: add n days

WEEK: add n weeks

MONTH: add n months

YEAR: add n years*/

SELECT P_CODE, P_INDATE
FROM PRODUCT;

SELECT P_CODE, P_INDATE, ADDDATE(P_INDATE, 30)
FROM PRODUCT
ORDER BY ADDDATE(P_INDATE, 30);

SELECT P_CODE, P_INDATE, DATE_ADD(P_INDATE, INTERVAL 2 YEAR)
FROM PRODUCT
ORDER BY DATE_ADD(P_INDATE, INTERVAL 2 YEAR);

/*Returns the date of the last day of the month given in a date

Syntax:

LAST_DAY(date_value)
*/

SELECT EMP_LNAME, EMP_FNAME, EMP_HIRE_DATE, LAST_DAY(EMP_HIRE_DATE)
FROM EMPLOYEE
WHERE EMP_HIRE_DATE >= DATE_ADD(LAST_DAY(EMP_HIRE_DATE), INTERVAL -7 DAY);

SELECT 1.95, -1.93, ABS(1.95), ABS(-1.93);

SELECT P_CODE, P_PRICE, ROUND(P_PRICE,1) AS PRICE1, ROUND(P_PRICE,0) AS PRICE0
FROM PRODUCT;

SELECT P_PRICE, CEIL(P_PRICE), FLOOR(P_PRICE)
FROM PRODUCT;

SELECT P_PRICE, CEILING(P_PRICE), FLOOR(P_PRICE)
FROM PRODUCT;

SELECT CONCAT(CONCAT(EMP_LNAME, ', '), EMP_FNAME) AS NAME
FROM EMPLOYEE;

SELECT EMP_LNAME, EMP_FNAME 
FROM EMPLOYEE;

/*
UPPER Oracle, MS SQL Server, and MySQL

UCASE MySQL and Access

LOWER Oracle, MS SQL Server, and MySQL

LCASE MySQL and Access

Returns a string in all capital or all lowercase letters

Syntax:

UPPER(strg_value)

UCASE(strg_value)

LOWER(strg_value)

LCASE(strg_value)

Lists all employee names in all capital letters (concatenated).*/

SELECT UPPER(CONCAT(CONCAT(EMP_LNAME, ', '), EMP_FNAME)) AS NAME
FROM EMPLOYEE;

SELECT LOWER(CONCAT(CONCAT(EMP_LNAME, ', '), EMP_FNAME)) AS NAME
FROM EMPLOYEE;

/*SUBSTRING

Returns a substring or part of a given string parameter

Syntax:

SUBSTR(strg_value, p, l) Oracle and MySQL

SUBSTRING(strg_value,p,l) MS SQL Server and MySQL

Lists the first three characters of all employee phone numbers.*/

SELECT EMP_PHONE, SUBSTR(EMP_PHONE,1,3) AS PREFIX
FROM EMPLOYEE;

SELECT EMP_PHONE, SUBSTRING(EMP_PHONE,1,3) AS PREFIX
FROM EMPLOYEE;

SELECT EMP_LNAME, LENGTH(EMP_LNAME) AS NAMESIZE
FROM EMPLOYEE;

/*
Conversion Functions
Conversion functions allow you to take a value of a given data type and convert it to the equivalent value in another data type.

Numeric or Date to Character:

CAST Oracle, MS SQL Server, MySQL

CONVERT MS SQL Server, MySQL

Syntax: CAST (value-to-convert AS char(length))

Note that Oracle and MS SQL Server can use CAST to convert the numeric data into fixed length or variable length character data type.
MySQL cannot CAST into variable length character data, only fixed length.

MySQL:

CONVERT(value-to-convert, char(length))

The primary difference between CAST and CONVERT is that CONVERT can also be used to change the character set of the data.

Lists all product prices, product received date, and percent discount using formatted values.*/

SELECT P_CODE, CAST(P_PRICE AS CHAR(8)) AS PRICE, CAST(P_INDATE AS CHAR(20)) AS INDATE, CAST(P_DISCOUNT AS CHAR(4)) AS DISC
FROM PRODUCT;

SELECT P_CODE, CONVERT(P_PRICE, CHAR(8)) AS PRICE, CONVERT(P_INDATE, CHAR(20)) AS INDATE
FROM PRODUCT;

SELECT CAST('-123.99' AS DECIMAL(8,2)), CAST('-99.78' AS DECIMAL(8,2));


/* case 不考*/
SELECT V_CODE, V_STATE,
CASE 
WHEN V_STATE = 'CA' THEN .08
WHEN V_STATE = 'FL' THEN .05
WHEN V_STATE = 'TN' THEN .085
ELSE 0.00 END AS TAX
FROM VENDOR

CREATE TABLE CUSTOMER_2 (
CUS_CODE	int,
CUS_LNAME	VARCHAR(15) NOT NULL,
CUS_FNAME	VARCHAR(15) NOT NULL,
CUS_INITIAL	CHAR(1),
CUS_AREACODE 	CHAR(3),
CUS_PHONE	CHAR(8));

INSERT INTO CUSTOMER_2 VALUES(345,'Terrell','Justine','H','615','322-9870');
INSERT INTO CUSTOMER_2 VALUES(347,'Olowski','Paul','F','615','894-2180');
INSERT INTO CUSTOMER_2 VALUES(351,'Hernandez','Carlos','J','723','123-7654');
INSERT INTO CUSTOMER_2 VALUES(352,'McDowell','George',NULL,'723','123-7768');
INSERT INTO CUSTOMER_2 VALUES(365,'Tirpin','Khaleed','G','723','123-9876');
INSERT INTO CUSTOMER_2 VALUES(368,'Lewis','Marie','J','734','332-1789');
INSERT INTO CUSTOMER_2 VALUES(369,'Dunne','Leona','K','713','894-1238');

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER;

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER_2;

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER
UNION
SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER_2;

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER
UNION ALL
SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER_2;

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER
INTERSECT
SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER_2;

SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER
WHERE (CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE) NOT IN
(SELECT CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE
FROM CUSTOMER_2);

SELECT CUS_CODE FROM CUSTOMER
WHERE CUS_AREACODE = '615' AND
CUS_CODE IN (SELECT DISTINCT CUS_CODE FROM INVOICE);

SELECT DISTINCT CUS_CODE 
FROM CUSTOMER JOIN INVOICE USING(CUS_CODE) 
WHERE CUS_AREACODE = '615';

SELECT CUS_CODE FROM CUSTOMER
WHERE CUS_AREACODE = '615' AND
CUS_CODE NOT IN (SELECT DISTINCT CUS_CODE FROM INVOICE);

CREATE VIEW PRICEGT50 AS
SELECT P_DESCRIPT, P_QOH, P_PRICE
FROM PRODUCT
WHERE P_PRICE > 50.00;

SELECT * FROM PRICEGT50;

SELECT P_DESCRIPT, P_QOH, P_PRICE
FROM PRODUCT
WHERE P_PRICE > 50.00;

CREATE VIEW PROD_STATS AS
SELECT V_CODE, SUM(P_QOH*P_PRICE) AS TOTCOST, MAX(P_QOH) AS MAXQTY, MIN(P_QOH) AS MINQTY, AVG(P_QOH) AS AVGQTY
FROM PRODUCT
GROUP BY V_CODE;

SELECT * FROM PROD_STATS;

CREATE TABLE PRODMASTER (
PROD_ID varchar(50),
PROD_DESC varchar(50),
PROD_QOH int
);
INSERT INTO PRODMASTER VALUES('A123','SCREWS','67');
INSERT INTO PRODMASTER VALUES('BX34','NUTS','37');
INSERT INTO PRODMASTER VALUES('C583','BOLTS','50');

CREATE TABLE PRODSALES (
PROD_ID varchar(50),
PS_QTY int
);
INSERT INTO PRODSALES VALUES('A123','7');
INSERT INTO PRODSALES VALUES('BX34','3');

SELECT * FROM PRODMASTER;

SELECT * FROM PRODSALES;

UPDATE PRODMASTER, PRODSALES
SET PRODMASTER.PROD_QOH = PROD_QOH - PS_QTY
WHERE PRODMASTER.PROD_ID = PRODSALES.PROD_ID;

SELECT * FROM PRODMASTER;

CREATE VIEW PSVUPD AS (
SELECT PRODMASTER.PROD_ID, PRODMASTER.PROD_QOH, PRODSALES.PS_QTY
FROM PRODMASTER, PRODSALES
WHERE PRODMASTER.PROD_ID = PRODSALES.PROD_ID);

SELECT * FROM PSVUPD;

SHOW TABLES;

DROP VIEW PSVUPD;

SHOW TABLES;



