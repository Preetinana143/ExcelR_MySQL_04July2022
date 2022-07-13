use cust;

SELECT * FROM CUSTOMER;
SET sql_safe_updates=0;

START TRANSACTION;
-- UPDATE CUSTOMER SET city='Mumbai' 
UPDATE CUSTOMER SET city='Chennai';
SELECT * FROM customer;
COMMIT;
-- ROLLBACK;

-- DCL -> DATA CONTROL LANGUAGE

-- GRANT and REVOKE

-- GRANT privileges ON <table> TO <root>

-- Privileges : SELECT , INSERT, DELETE, UPDATE, ALTER, GRANT ,ALL

GRANT SELECT , INSERT, UPDATE ,DELETE ON customer TO 'root'@'localhost';

GRANT ALL ON customer TO 'root'@'localhost';

REVOKE SELECT,INSERT,UPDATE,ALTER ON customer FROM 'root'@'localhost';

SELECT * FROM CUSTOMER;

DELETE FROM CUSTOMER WHERE custname='Priya';


SHOW GRANTS ;

-- FUNCTIONS:

SELECT * FROM CUSTOMER;

-- CONCAT FUNCTION

SELECT CONCAT(custname," ",city) as cust_city FROM customer;

SELECT custname, LENGTH(custname) as len FROM CUSTOMER;

SELECT LOWER(custname) FROM customer;

SELECT UPPER(custname) FROM customer;

SELECT REPLACE(city,"Chennai","Madras") FROM customer;

-- CREATE TABLE customer_city AS
-- SELECT custid, custname, city, concat(custname,"-",city) as cust_city FROM customer;

-- CREATE TABLE customer AS
-- SELECT * FROM customer_city;

-- SELECT * FROM CUSTOMER;

-- Numeric Function

SELECT COUNT(*) FROM Transaction_tbl;
SELECT max(amount) FROM Transaction_tbl;
SELECT min(amount) FROM Transaction_tbl;
SELECT sum(amount) FROM Transaction_tbl;
SELECT avg(amount) FROM Transaction_tbl;

-- Date function

SELECT current_date() FROM DUAL;
SELECT current_time() FROM DUAL;
SELECT current_timestamp() FROM DUAL;

SELECT * FROM transaction_tbl;

CREATE TABLE order_tbl(
orderId INT,
custId INT,
productname VARCHAR(100),
amount INT,
ordered_date date);

INSERT INTO order_tbl VALUES(1,1000,'TV',75000,'2020-05-01');
INSERT INTO order_tbl VALUES(1,1000,'Mobile',75000,'2020-05-31');
INSERT INTO order_tbl VALUES(1,1000,'Fridge',75000,'2022-05-11');
INSERT INTO order_tbl VALUES(1,1000,'WM',75000,'2022-05-01');
INSERT INTO order_tbl VALUES(1,1000,'GR',75000,'2021-06-21');
INSERT INTO order_tbl VALUES(1,1000,'Laptop',75000,'2022-06-01');

SELECT * FROM order_tbl;

SELECT * FROM order_tbl WHERE YEAR(ordered_date)='2020';
SELECT * FROM order_tbl WHERE MONTH(ordered_date)='05';
SELECT DAYNAME(ordered_date) FROM order_tbl WHERE DAY(ordered_date)='31';

