SHOW DATABASES;

CREATE database dbmscourse;

use dbmscourse;

CREATE TABLE VENDOR (
    V_CODE INTEGER NOT NULL UNIQUE,
    V_NAME VARCHAR(35) NOT NULL,
    V_CONTACT VARCHAR(25) NOT NULL,
    V_AREACODE CHAR(3) NOT NULL,
    V_PHONE CHAR(8) NOT NULL,
    V_STATE CHAR(2) NOT NULL,
    V_ORDER CHAR(1) NOT NULL,
    PRIMARY KEY (V_CODE)
);

show TABLES;

desc VENDOR;

show TABLE STATUS WHERE Name = 'VENDOR';

CREATE TABLE PRODUCT (
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

show TABLES;

desc PRODUCT;

desc VENDOR;

INSERT INTO
    VENDOR
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
        '25501',
        'Damal Supplies',
        'Smythe',
        '615',
        '890-3529',
        'TN',
        'N'
    );
/*INSERT INTO VENDOR VALUES('25595','Rubicon Systems','Orton','904','456-0092','FL','Y');*/
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
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
VALUES (
        'WR3/TT3',
        'Steel matting, 4''x8''x1/6", .5" mesh',
        '2014-1-17',
        '18',
        '5',
        '119.95',
        '0.1',
        '25595'
    );

SELECT * FROM PRODUCT;

SELECT P_CODE, P_PRICE FROM PRODUCT;

SELECT P_CODE, P_PRICE FROM PRODUCT WHERE P_PRICE > 20;

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE
    V_CODE = 21344;

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE
    V_CODE != 21344;

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE
    V_CODE <> 21344;

SELECT
    P_DESCRIPT,
    P_QOH,
    P_MIN,
    P_PRICE,
    P_INDATE
FROM PRODUCT
WHERE
    P_INDATE >= "2014-1-20";

SELECT P_DESCRIPT, P_QOH, P_PRICE, P_PRICE * P_QOH FROM PRODUCT;

SELECT
    P_DESCRIPT,
    P_QOH,
    P_PRICE,
    P_PRICE * P_QOH AS TOTVALUE
FROM PRODUCT;

SELECT
    P_DESCRIPT,
    P_QOH,
    P_PRICE,
    ROUND(P_PRICE * P_QOH) AS TOTVALUE
FROM PRODUCT;

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE
    V_CODE = 21344
    or V_CODE = 24288;

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE
    P_PRICE < 50
    and P_INDATE > "2014-1-15";

SELECT
    P_DESCRIPT,
    P_INDATE,
    P_PRICE,
    V_CODE
FROM PRODUCT
WHERE (
        P_PRICE < 50
        or P_INDATE > "2014-1-15"
    )
    OR V_CODE = 24288;

SELECT * FROM PRODUCT WHERE NOT(V_CODE = 21344);

SELECT * FROM PRODUCT WHERE V_CODE != 21344;

SELECT * FROM PRODUCT WHERE P_PRICE BETWEEN 50 AND 100;

SELECT * FROM PRODUCT WHERE P_PRICE >= 50 and P_PRICE <= 100;

SELECT P_CODE, P_DESCRIPT, V_CODE FROM PRODUCT WHERE V_CODE is NULL;

SELECT P_CODE, P_DESCRIPT, P_INDATE
FROM PRODUCT
WHERE
    P_INDATE is NULL;

SELECT
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE
FROM VENDOR
WHERE
    V_CONTACT LIKE 'Smith%';

SELECT
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE
FROM VENDOR
WHERE
    V_CONTACT LIKE 'SMITH%';

SELECT
    V_NAME,
    V_CONTACT,
    V_AREACODE,
    V_PHONE
FROM VENDOR
WHERE
    V_CONTACT NOT LIKE 'Smith%';

UPDATE VENDOR SET V_CONTACT = "Smyth" WHERE V_CODE = 25501;

SELECT * FROM VENDOR WHERE V_CONTACT LIKE "Sm_th";

SELECT * FROM PRODUCT WHERE V_CODE = 21344 OR V_CODE = 24288;

SELECT * FROM PRODUCT WHERE V_CODE IN (21344, 24288);

SELECT V_CODE, V_NAME
FROM VENDOR
WHERE
    V_CODE IN (
        SELECT V_CODE
        FROM PRODUCT
    );

SELECT DISTINCT V_CODE FROM PRODUCT;

SELECT *
FROM VENDOR
WHERE
    EXISTS (
        SELECT *
        FROM PRODUCT
        WHERE
            P_QOH <= P_MIN *2
    );


SELECT * FROM VENDOR WHERE EXISTS (SELECT * FROM PRODUCT WHERE P_QOH <= P_MIN*2);
SELECT * FROM PRODUCT WHERE P_QOh <= P_MIN *2;

SELECT * FROM PRODUCT WHERE P_QOH < P_MIN * 2;

SELECT *
FROM VENDOR
WHERE
    V_CODE IN (
        SELECT V_CODE
        FROM PRODUCT
        WHERE
            PRODUCT.V_CODE = VENDOR.V_CODE
    );

SELECT * FROM PRODUCT WHERE P_CODE = '13-Q2/P2';

UPDATE PRODUCT SET P_INDATE = '2014-1-18' WHERE P_CODE = '13-Q2/P2';

SELECT * FROM PRODUCT WHERE P_CODE = '13-Q2/P2';

UPDATE PRODUCT SET P_MIN = 10, P_PRICE = 14.79 WHERE P_CODE = '13-Q2/P2';

SELECT * FROM PRODUCT WHERE P_CODE = '13-Q2/P2';

SELECT * FROM PRODUCT WHERE P_CODE = '11QER/31';

DELETE FROM PRODUCT WHERE P_CODE = '11QER/31';

SELECT * FROM PRODUCT WHERE P_CODE = '11QER/31';

SELECT * FROM PRODUCT;

DELETE FROM PRODUCT WHERE P_QOH = 32 AND P_MIN = 10;

SELECT * FROM PRODUCT;

