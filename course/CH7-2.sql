use dbmscourse;

drop table if exists PRODUCT;

drop table if exists VENDOR;

show tables;

CREATE TABLE
    VENDOR (
        V_CODE INTEGER NOT NULL UNIQUE,
        V_NAME VARCHAR(35) NOT NULL,
        V_CONTACT VARCHAR(25) NOT NULL,
        V_AREACODE CHAR(3) NOT NULL,
        V_PHONE CHAR(8) NOT NULL,
        V_STATE CHAR(2) NOT NULL,
        V_ORDER CHAR(1) NOT NULL,
        PRIMARY KEY (V_CODE)
    );

CREATE TABLE
    PRODUCT (
        P_CODE VARCHAR(10) NOT NULL UNIQUE,
        P_DESCRIPT VARCHAR(35) NOT NULL,
        P_INDATE DATE NOT NULL,
        P_QOH SMALLINT NOT NULL,
        P_MIN SMALLINT NOT NULL,
        P_PRICE DECIMAL(8, 2) NOT NULL,
        P_DISCOUNT DECIMAL(5, 2) NOT NULL,
        V_CODE INTEGER,
        PRIMARY KEY (P_CODE),
        FOREIGN KEY (V_CODE) REFERENCES VENDOR (V_CODE)
    );

INSERT INTO
    VENDOR
VALUES
    (
        '21225',
        'Bryson, Inc.',
        'Smithson',
        '615',
        '223-3234',
        'TN',
        'Y'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '21226',
        'SuperLoo, Inc.',
        'Flushing',
        '904',
        '215-8995',
        'FL',
        'N'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '21231',
        'D&E Supply',
        'Singh',
        '615',
        '228-3245',
        'TN',
        'Y'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '21344',
        'Gomez Bros.',
        'Ortega',
        '615',
        '889-2546',
        'KY',
        'N'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '22567',
        'Dome Supply',
        'Smith',
        '901',
        '678-1419',
        'GA',
        'N'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '23119',
        'Randsets Ltd.',
        'Anderson',
        '901',
        '678-3998',
        'GA',
        'Y'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '24004',
        'Brackman Bros.',
        'Browning',
        '615',
        '228-1410',
        'TN',
        'N'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '24288',
        'ORDVA, Inc.',
        'Hakford',
        '615',
        '898-1234',
        'TN',
        'Y'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '25443',
        'B&K, Inc.',
        'Smith',
        '904',
        '227-0093',
        'FL',
        'N'
    );

INSERT INTO
    VENDOR
VALUES
    (
        '25501',
        'Damal Supplies',
        'Smythe',
        '615',
        '890-3529',
        'TN',
        'N'
    );

INSERT INTO
    VENDOR (
        V_CODE,
        V_NAME,
        V_CONTACT,
        V_AREACODE,
        V_PHONE,
        V_STATE,
        V_ORDER
    )
VALUES
    (
        '25595',
        'Rubicon Systems',
        'Orton',
        '904',
        '456-0092',
        'FL',
        'Y'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '11QER/31',
        'Power painter, 15 psi., 3-nozzle',
        '2013-11-3',
        '8',
        '5',
        '109.99',
        '0',
        '25595'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '13-Q2/P2',
        '7.25-in. pwr. saw blade',
        '2013-12-13',
        '32',
        '15',
        '14.99',
        '0.05',
        '21344'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '14-Q1/L3',
        '9.00-in. pwr. saw blade',
        '2013-11-13',
        '18',
        '12',
        '17.49',
        '0',
        '21344'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '1546-QQ2',
        'Hrd. cloth, 1/4-in., 2x50',
        '2014-1-15',
        '15',
        '8',
        '39.95',
        '0',
        '23119'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '1558-QW1',
        'Hrd. cloth, 1/2-in., 3x50',
        '2014-1-15',
        '23',
        '5',
        '43.99',
        '0',
        '23119'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '2232/QTY',
        'B\&D jigsaw, 12-in. blade',
        '2013-12-30',
        '8',
        '5',
        '109.92',
        '0.05',
        '24288'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '2232/QWE',
        'B\&D jigsaw, 8-in. blade',
        '2013-12-24',
        '6',
        '5',
        '99.87',
        '0.05',
        '24288'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '2238/QPD',
        'B\&D cordless drill, 1/2-in.',
        '2014-1-20',
        '12',
        '5',
        '38.95',
        '0.05',
        '25595'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '23109-HB',
        'Claw hammer',
        '2014-1-20',
        '23',
        '10',
        '9.95',
        '0.1',
        '21225'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '23114-AA',
        'Sledge hammer, 12 lb.',
        '2014-1-2',
        '8',
        '5',
        '14.40',
        '0.05',
        NULL
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '54778-2T',
        'Rat-tail file, 1/8-in. fine',
        '2013-12-15',
        '43',
        '20',
        '4.99',
        '0',
        '21344'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        '89-WRE-Q',
        'Hicut chain saw, 16 in.',
        '2014-2-7',
        '11',
        '5',
        '256.99',
        '0.05',
        '24288'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        'PVC23DRT',
        'PVC pipe, 3.5-in., 8-ft',
        '2014-2-20',
        '188',
        '75',
        '5.87',
        '0',
        NULL
    );

INSERT INTO
    PRODUCT
VALUES
    (
        'SM-18277',
        '1.25-in. metal screw, 25',
        '2014-3-1',
        '172',
        '75',
        '6.99',
        '0',
        '21225'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        'SW-23116',
        '2.5-in. wd. screw, 50',
        '2014-2-24',
        '237',
        '100',
        '8.45',
        '0',
        '21231'
    );

INSERT INTO
    PRODUCT
VALUES
    (
        'WR3/TT3',
        'Steel matting, 4''x8''x1/6", .5" mesh',
        '2014-1-17',
        '18',
        '5',
        '119.95',
        '0.1',
        '25595'
    );

DESC PRODUCT;

ALTER TABLE PRODUCT
ADD COLUMN (P_SALECODE CHAR(1));

DESC PRODUCT;

ALTER TABLE PRODUCT MODIFY P_PRICE DECIMAL(9, 2);

DESC PRODUCT;

DESC VENDOR;

ALTER TABLE VENDOR
DROP COLUMN V_ORDER;

DESC VENDOR;

SELECT
    *
FROM
    PRODUCT
WHERE
    P_CODE = '1546-QQ2';

UPDATE PRODUCT
SET
    P_SALECODE = '2'
WHERE
    P_CODE = '1546-QQ2';

SELECT
    *
FROM
    PRODUCT
WHERE
    P_CODE = '1546-QQ2'
UPDATE PRODUCT
SET
    P_SALECODE = '1'
WHERE
    P_CODE IN ('2232/QWE', '2232/QTY');

SELECT
    *
FROM
    PRODUCT
WHERE
    P_CODE IN ('2232/QWE', '2232/QTY');

UPDATE PRODUCT
SET
    P_SALECODE = '1'
WHERE
    P_CODE = '2232/QWE'
    OR P_CODE = '2232/QTY';

SELECT
    *
FROM
    PRODUCT
WHERE
    P_CODE = '2232/QWE'
    OR P_CODE = '2232/QTY';

UPDATE PRODUCT
SET
    P_SALECODE = '2'
WHERE
    P_INDATE < '2013-12-25';

UPDATE PRODUCT
SET
    P_SALECODE = '1'
WHERE
    P_INDATE >= '2014-01-16'
    AND P_INDATE <= '2014-02-10';

SELECT
    P_CODE,
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    P_SALECODE
FROM
    PRODUCT;

SELECT
    P_QOH
FROM
    PRODUCT
WHERE
    P_CODE = '2232/QWE';

UPDATE PRODUCT
SET
    P_QOH = P_QOH + 20
WHERE
    P_CODE = '2232/QWE';

SELECT
    P_QOH
FROM
    PRODUCT
WHERE
    P_CODE = '2232/QWE';

SELECT
    P_PRICE
FROM
    PRODUCT
WHERE
    P_PRICE < 50.00;

UPDATE PRODUCT
SET
    P_PRICE = P_PRICE * 1.1
WHERE
    P_PRICE < 50.00;

SELECT
    P_PRICE
FROM
    PRODUCT
WHERE
    P_PRICE < 50.00;

DROP TABLE IF EXISTS PART;

CREATE TABLE
    PART (
        PART_CODE CHAR(8),
        PART_DESCRIPT CHAR(35),
        PART_PRICE DECIMAL(8, 2),
        V_CODE INTEGER,
        PRIMARY KEY (PART_CODE)
    );

DESC PART;

/* INSERT INTO [A](.....) SELECT [.......] means put the data in [B......] into [A](.....)  */
INSERT INTO
    PART (PART_CODE, PART_DESCRIPT, PART_PRICE, V_CODE)
SELECT
    P_CODE,
    P_DESCRIPT,
    P_PRICE,
    V_CODE
FROM
    PRODUCT;

SELECT
    *
FROM
    PART;

DROP TABLE IF EXISTS PART;

FLUSH TABLES PART;

show tables;

CREATE TABLE
    PART2
SELECT
    P_CODE AS PART_CODE,
    P_DESCRIPT AS PART_DESCRIPT,
    P_PRICE AS PART_PRICE,
    V_CODE
FROM
    PRODUCT;

SHOW TABLES;

SELECT
    *
FROM
    PART2;

DESC PART2;

ALTER TABLE PART2 ADD PRIMARY KEY (PART_CODE);

DESC PART2;

ALTER TABLE PART2 ADD FOREIGN KEY (V_CODE) REFERENCES VENDOR (V_CODE);

DESC PART2;

SELECT
    P_CODE,
    P_DESCRIPT,
    P_INDATE,
    P_PRICE
FROM
    PRODUCT
ORDER BY
    P_PRICE;

SELECT
    P_CODE,
    P_DESCRIPT,
    P_INDATE,
    P_PRICE
FROM
    PRODUCT
ORDER BY
    P_PRICE DESC;

CREATE TABLE
    EMPLOYEE (
        EMP_NUM int,
        EMP_TITLE varchar(4),
        EMP_LNAME varchar(15),
        EMP_FNAME varchar(15),
        EMP_INITIAL varchar(1),
        EMP_DOB datetime,
        EMP_HIRE_DATE datetime,
        EMP_YEARS int,
        EMP_AREACODE varchar(3),
        EMP_PHONE varchar(8)
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '100',
        'Mr.',
        'Kolmycz',
        'George',
        'D',
        '1942-6-15',
        '1985-3-15',
        '18',
        '615',
        '324-5456'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '101',
        'Ms.',
        'Lewis',
        'Rhonda',
        'G',
        '1965-3-19',
        '1986-4-25',
        '16',
        '615',
        '324-4472'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '102',
        'Mr.',
        'VanDam',
        'Rhett',
        '',
        '1958-11-14',
        '1990-12-20',
        '12',
        '901',
        '675-8993'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '103',
        'Ms.',
        'Jones',
        'Anne',
        'M',
        '1974-10-16',
        '1994-8-28',
        '8',
        '615',
        '898-3456'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '104',
        'Mr.',
        'Lange',
        'John',
        'P',
        '1971-11-8',
        '1994-10-20',
        '8',
        '901',
        '504-4430'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '105',
        'Mr.',
        'Williams',
        'Robert',
        'D',
        '1975-3-14',
        '1998-11-8',
        '4',
        '615',
        '890-3220'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '106',
        'Mrs.',
        'Smith',
        'Jeanine',
        'K',
        '1968-2-12',
        '1989-1-5',
        '14',
        '615',
        '324-7883'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '107',
        'Mr.',
        'Diante',
        'Jorge',
        'D',
        '1974-8-21',
        '1994-7-2',
        '8',
        '615',
        '890-4567'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '108',
        'Mr.',
        'Wiesenbach',
        'Paul',
        'R',
        '1966-2-14',
        '1992-11-18',
        '10',
        '615',
        '897-4358'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '109',
        'Mr.',
        'Smith',
        'George',
        'K',
        '1961-6-18',
        '1989-4-14',
        '13',
        '901',
        '504-3339'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '110',
        'Mrs.',
        'Genkazi',
        'Leighla',
        'W',
        '1970-5-19',
        '1990-12-1',
        '12',
        '901',
        '569-0093'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '111',
        'Mr.',
        'Washington',
        'Rupert',
        'E',
        '1966-1-3',
        '1993-6-21',
        '9',
        '615',
        '890-4925'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '112',
        'Mr.',
        'Johnson',
        'Edward',
        'E',
        '1961-5-14',
        '1983-12-1',
        '19',
        '615',
        '898-4387'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '113',
        'Ms.',
        'Smythe',
        'Melanie',
        'P',
        '1970-9-15',
        '1999-5-11',
        '3',
        '615',
        '324-9006'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '114',
        'Ms.',
        'Brandon',
        'Marie',
        'G',
        '1956-11-2',
        '1979-11-15',
        '23',
        '901',
        '882-0845'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '115',
        'Mrs.',
        'Saranda',
        'Hermine',
        'R',
        '1972-7-25',
        '1993-4-23',
        '9',
        '615',
        '324-5505'
    );

INSERT INTO
    EMPLOYEE
VALUES
    (
        '116',
        'Mr.',
        'Smith',
        'George',
        'A',
        '1965-11-8',
        '1988-12-10',
        '14',
        '615',
        '890-2984'
    );

SELECT
    EMP_LNAME,
    EMP_FNAME,
    EMP_INITIAL,
    EMP_AREACODE,
    EMP_PHONE
FROM
    EMPLOYEE
SELECT
    EMP_LNAME,
    EMP_FNAME,
    EMP_INITIAL,
    EMP_AREACODE,
    EMP_PHONE
FROM
    EMPLOYEE
ORDER BY
    EMP_LNAME,
    EMP_FNAME,
    EMP_INITIAL;

SELECT
    P_DESCRIPT,
    V_CODE,
    P_INDATE,
    P_PRICE
FROM
    PRODUCT
WHERE
    P_INDATE < '2014-01-21'
    AND P_PRICE <= 50.00
SELECT
    P_DESCRIPT,
    V_CODE,
    P_INDATE,
    P_PRICE
FROM
    PRODUCT
WHERE
    P_INDATE < '2014-01-21'
    AND P_PRICE <= 50.00
ORDER BY
    V_CODE,
    P_PRICE DESC;

SELECT
    V_CODE
FROM
    PRODUCT;

SELECT DISTINCT
    V_CODE
FROM
    PRODUCT;

SELECT
    V_CODE
FROM
    PRODUCT;

SELECT
    COUNT(V_CODE)
FROM
    PRODUCT;

SELECT
    *
FROM
    PRODUCT
WHERE
    V_CODE is NULL;

SELECT DISTINCT
    V_CODE
FROM
    PRODUCT;

SELECT
    COUNT(V_CODE)
FROM
    PRODUCT;

SELECT
    *
FROM
    PRODUCT
WHERE
    V_CODE is NULL;

SELECT DISTINCT
    V_CODE
FROM
    PRODUCT;

SELECT
    COUNT(DISTINCT V_CODE)
FROM
    PRODUCT;

SELECT
    *
FROM
    PRODUCT
WHERE
    P_PRICE <= 10;

SELECT
    COUNT(DISTINCT V_CODE)
FROM
    PRODUCT
WHERE
    P_PRICE <= 10;

SELECT
    COUNT(*)
FROM
    PRODUCT
WHERE
    P_PRICE <= 10;

SELECT
    P_CODE,
    P_DESCRIPT,
    P_PRICE
FROM
    PRODUCT
WHERE
    P_PRICE = (
        SELECT
            MAX(P_PRICE)
        FROM
            PRODUCT
    );

SELECT
    MIN(P_PRICE)
FROM
    PRODUCT;

CREATE TABLE
    CUSTOMER (
        CUS_CODE int,
        CUS_LNAME varchar(15),
        CUS_FNAME varchar(15),
        CUS_INITIAL varchar(1),
        CUS_AREACODE varchar(3),
        CUS_PHONE varchar(8),
        CUS_BALANCE float (8),
        PRIMARY KEY (CUS_CODE)
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10010',
        'Ramas',
        'Alfred',
        'A',
        '615',
        '844-2573',
        '0'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10011',
        'Dunne',
        'Leona',
        'K',
        '713',
        '894-1238',
        '0'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10012',
        'Smith',
        'Kathy',
        'W',
        '615',
        '894-2285',
        '345.859985351562'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10013',
        'Olowski',
        'Paul',
        'F',
        '615',
        '894-2180',
        '536.75'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10014',
        'Orlando',
        'Myron',
        '',
        '615',
        '222-1672',
        '0'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10015',
        'O''Brian',
        'Amy',
        'B',
        '713',
        '442-3381',
        '0'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10016',
        'Brown',
        'James',
        'G',
        '615',
        '297-1228',
        '221.190002441406'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10017',
        'Williams',
        'George',
        '',
        '615',
        '290-2556',
        '768.929992675781'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10018',
        'Farriss',
        'Anne',
        'G',
        '713',
        '382-7185',
        '216.550003051758'
    );

INSERT INTO
    CUSTOMER
VALUES
    (
        '10019',
        'Smith',
        'Olette',
        'K',
        '615',
        '297-3809',
        '0'
    );

SELECT
    *
FROM
    CUSTOMER;

SELECT
    SUM(CUS_BALANCE)
FROM
    CUSTOMER;

SELECT
    SUM(P_QOH * P_PRICE) AS TOTVALUE
FROM
    PRODUCT;

SELECT
    AVG(P_PRICE)
FROM
    PRODUCT;

SELECT
    *
FROM
    PRODUCT;

SELECT
    P_SALECODE,
    MIN(P_PRICE),
    MAX(P_PRICE),
    AVG(P_PRICE)
FROM
    PRODUCT
GROUP BY
    P_SALECODE
ORDER BY
    P_SALECODE;

SELECT
    V_CODE,
    COUNT(DISTINCT (P_CODE))
FROM
    PRODUCT
GROUP BY
    V_CODE;

SELECT
    V_CODE,
    COUNT(DISTINCT P_CODE)
FROM
    PRODUCT
GROUP BY
    V_CODE;

SELECT
    V_CODE,
    COUNT(DISTINCT (P_CODE)),
    AVG(P_PRICE)
FROM
    PRODUCT
GROUP BY
    V_CODE;

SELECT
    V_CODE,
    COUNT(DISTINCT P_CODE),
    AVG(P_PRICE)
FROM
    PRODUCT
GROUP BY
    V_CODE
HAVING
    AVG(P_PRICE) < 10;

SELECT
    V_CODE,
    SUM(P_QOH * P_PRICE) AS TOTCOST
FROM
    PRODUCT
GROUP BY
    V_CODE
HAVING
    (SUM(P_QOH * P_PRICE) > 500)
ORDER BY
    SUM(P_QOH * P_PRICE) DESC;

SELECT
    V_CODE,
    SUM(P_QOH * P_PRICE) AS TOTCOST
FROM
    PRODUCT
GROUP BY
    V_CODE
HAVING
    TOTCOST > 500
ORDER BY
    TOTCOST DESC;

SELECT
    P_DESCRIPT,
    P_PRICE,
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE,
    PRODUCT.V_CODE
FROM
    PRODUCT,
    VENDOR
WHERE
    PRODUCT.V_CODE = VENDOR.V_CODE;

SELECT
    PRODUCT.P_DESCRIPT,
    PRODUCT.P_PRICE,
    VENDOR.V_NAME,
    VENDOR.V_CONTACT,
    VENDOR.V_AREACODE,
    VENDOR.V_PHONE
FROM
    PRODUCT,
    VENDOR
WHERE
    PRODUCT.V_CODE = VENDOR.V_CODE
ORDER BY
    PRODUCT.P_PRICE;

SELECT
    P_DESCRIPT,
    P_PRICE,
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE
FROM
    PRODUCT,
    VENDOR
WHERE
    PRODUCT.V_CODE = VENDOR.V_CODE
    AND P_INDATE > '2014-01-15';

CREATE TABLE
    INVOICE (
        INV_NUMBER int,
        CUS_CODE int,
        INV_DATE datetime,
        PRIMARY KEY (INV_NUMBER),
        FOREIGN KEY (CUS_CODE) REFERENCES CUSTOMER (CUS_CODE)
    );

INSERT INTO
    INVOICE
VALUES
    ('1001', '10014', '2014-1-16');

INSERT INTO
    INVOICE
VALUES
    ('1002', '10011', '2014-1-16');

INSERT INTO
    INVOICE
VALUES
    ('1003', '10012', '2014-1-16');

INSERT INTO
    INVOICE
VALUES
    ('1004', '10011', '2014-1-17');

INSERT INTO
    INVOICE
VALUES
    ('1005', '10018', '2014-1-17');

INSERT INTO
    INVOICE
VALUES
    ('1006', '10014', '2014-1-17');

INSERT INTO
    INVOICE
VALUES
    ('1007', '10015', '2014-1-17');

INSERT INTO
    INVOICE
VALUES
    ('1008', '10011', '2014-1-17');

CREATE TABLE
    LINE (
        INV_NUMBER int,
        LINE_NUMBER int,
        P_CODE varchar(10),
        LINE_UNITS float (8),
        LINE_PRICE float (8),
        PRIMARY KEY (LINE_NUMBER, INV_NUMBER),
        FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE (INV_NUMBER),
        FOREIGN KEY (P_CODE) REFERENCES PRODUCT (P_CODE)
    );

INSERT INTO
    LINE
VALUES
    ('1001', '1', '13-Q2/P2', '1', '14.99');

INSERT INTO
    LINE
VALUES
    ('1001', '2', '23109-HB', '1', '9.95');

INSERT INTO
    LINE
VALUES
    ('1002', '1', '54778-2T', '2', '4.99');

INSERT INTO
    LINE
VALUES
    ('1003', '1', '2238/QPD', '1', '38.95');

INSERT INTO
    LINE
VALUES
    ('1003', '2', '1546-QQ2', '1', '39.95');

INSERT INTO
    LINE
VALUES
    ('1003', '3', '13-Q2/P2', '5', '14.99');

INSERT INTO
    LINE
VALUES
    ('1004', '1', '54778-2T', '3', '4.99');

INSERT INTO
    LINE
VALUES
    ('1004', '2', '23109-HB', '2', '9.95');

INSERT INTO
    LINE
VALUES
    ('1005', '1', 'PVC23DRT', '12', '5.87');

INSERT INTO
    LINE
VALUES
    ('1006', '1', 'SM-18277', '3', '6.99');

INSERT INTO
    LINE
VALUES
    ('1006', '2', '2232/QTY', '1', '109.92');

INSERT INTO
    LINE
VALUES
    ('1006', '3', '23109-HB', '1', '9.95');

INSERT INTO
    LINE
VALUES
    ('1006', '4', '89-WRE-Q', '1', '256.99');

INSERT INTO
    LINE
VALUES
    ('1007', '1', '13-Q2/P2', '2', '14.99');

INSERT INTO
    LINE
VALUES
    ('1007', '2', '54778-2T', '1', '4.99');

INSERT INTO
    LINE
VALUES
    ('1008', '1', 'PVC23DRT', '5', '5.87');

INSERT INTO
    LINE
VALUES
    ('1008', '2', 'WR3/TT3', '3', '119.95');

INSERT INTO
    LINE
VALUES
    ('1008', '3', '23109-HB', '1', '9.95');

SELECT
    CUS_LNAME,
    INVOICE.INV_NUMBER,
    INV_DATE,
    P_DESCRIPT
FROM
    CUSTOMER,
    INVOICE,
    LINE,
    PRODUCT
WHERE
    CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
    AND INVOICE.INV_NUMBER = LINE.INV_NUMBER
    AND LINE.P_CODE = PRODUCT.P_CODE
    AND CUSTOMER.CUS_CODE = 10014
ORDER BY
    INV_NUMBER;

SELECT
    P_DESCRIPT,
    P_PRICE,
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE
FROM
    PRODUCT P,
    VENDOR V
WHERE
    P.V_CODE = V.V_CODE
ORDER BY
    P_PRICE;

CREATE TABLE
    EMP (
        EMP_NUM int,
        EMP_TITLE varchar(4),
        EMP_LNAME varchar(15),
        EMP_FNAME varchar(15),
        EMP_INITIAL varchar(1),
        EMP_DOB datetime,
        EMP_HIRE_DATE datetime,
        EMP_AREACODE varchar(3),
        EMP_PHONE varchar(8),
        EMP_MGR int
    );

INSERT INTO
    EMP
VALUES
    (
        '100',
        'Mr.',
        'Kolmycz',
        'George',
        'D',
        '1945-6-15',
        '1985-3-15',
        '615',
        '324-5456',
        NULL
    );

INSERT INTO
    EMP
VALUES
    (
        '101',
        'Ms.',
        'Lewis',
        'Rhonda',
        'G',
        '1965-3-19',
        '1986-4-25',
        '615',
        '324-4472',
        '100'
    );

INSERT INTO
    EMP
VALUES
    (
        '102',
        'Mr.',
        'VanDam',
        'Rhett',
        '',
        '1958-11-14',
        '1990-12-20',
        '901',
        '675-8993',
        '100'
    );

INSERT INTO
    EMP
VALUES
    (
        '103',
        'Ms.',
        'Jones',
        'Anne',
        'M',
        '1974-10-16',
        '1994-8-28',
        '615',
        '898-3456',
        '100'
    );

INSERT INTO
    EMP
VALUES
    (
        '104',
        'Mr.',
        'Lange',
        'John',
        'P',
        '1971-11-8',
        '1994-10-20',
        '901',
        '504-4430',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '105',
        'Mr.',
        'Williams',
        'Robert',
        'D',
        '1975-3-14',
        '1998-11-8',
        '615',
        '890-3220',
        NULL
    );

INSERT INTO
    EMP
VALUES
    (
        '106',
        'Mrs.',
        'Smith',
        'Jeanine',
        'K',
        '1968-2-12',
        '1989-1-5',
        '615',
        '324-7883',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '107',
        'Mr.',
        'Diante',
        'Jorge',
        'D',
        '1974-8-21',
        '1994-7-2',
        '615',
        '890-4567',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '108',
        'Mr.',
        'Wiesenbach',
        'Paul',
        'R',
        '1966-2-14',
        '1992-11-18',
        '615',
        '897-4358',
        NULL
    );

INSERT INTO
    EMP
VALUES
    (
        '109',
        'Mr.',
        'Smith',
        'George',
        'K',
        '1961-6-18',
        '1989-4-14',
        '901',
        '504-3339',
        '108'
    );

INSERT INTO
    EMP
VALUES
    (
        '110',
        'Mrs.',
        'Genkazi',
        'Leighla',
        'W',
        '1970-5-19',
        '1990-12-1',
        '901',
        '569-0093',
        '108'
    );

INSERT INTO
    EMP
VALUES
    (
        '111',
        'Mr.',
        'Washington',
        'Rupert',
        'E',
        '1966-1-3',
        '1993-6-21',
        '615',
        '890-4925',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '112',
        'Mr.',
        'Johnson',
        'Edward',
        'E',
        '1961-5-14',
        '1983-12-1',
        '615',
        '898-4387',
        '100'
    );

INSERT INTO
    EMP
VALUES
    (
        '113',
        'Ms.',
        'Smythe',
        'Melanie',
        'P',
        '1970-9-15',
        '1999-5-11',
        '615',
        '324-9006',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '114',
        'Ms.',
        'Brandon',
        'Marie',
        'G',
        '1956-11-2',
        '1979-11-15',
        '901',
        '882-0845',
        '108'
    );

INSERT INTO
    EMP
VALUES
    (
        '115',
        'Mrs.',
        'Saranda',
        'Hermine',
        'R',
        '1972-7-25',
        '1993-4-23',
        '615',
        '324-5505',
        '105'
    );

INSERT INTO
    EMP
VALUES
    (
        '116',
        'Mr.',
        'Smith',
        'George',
        'A',
        '1965-11-8',
        '1988-12-10',
        '615',
        '890-2984',
        '108'
    );

SELECT
    E.EMP_NUM,
    E.EMP_LNAME,
    E.EMP_MGR,
    M.EMP_LNAME
FROM
    EMP E,
    EMP M
WHERE
    E.EMP_MGR = M.EMP_NUM
ORDER BY
    E.EMP_MGR;

SELECT
    E.EMP_NUM,
    E.EMP_LNAME,
    E.EMP_MGR,
    M.EMP_LNAME AS Manager_LNAME
FROM
    EMP E,
    EMP M
WHERE
    E.EMP_MGR = M.EMP_NUM
ORDER BY
    E.EMP_MGR;