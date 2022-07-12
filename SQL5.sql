create database cust;

use cust;

CREATE TABLE customer(
custid INT UNIQUE,
custname VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);



INSERT INTO CUSTOMER VALUES(1000,' Bala',' Chennai');
INSERT INTO CUSTOMER VALUES(1001,' Siva',' Bangalore');
INSERT INTO CUSTOMER VALUES(1002,' Karthik',' Hyderabad');
INSERT INTO CUSTOMER VALUES(1003,' Ganesh',' Visakapattinam');
INSERT INTO CUSTOMER VALUES(1004,' Sarath',' Pune');


SELECT * FROM CUSTOMER;

-- DELETE FROM CUSTOMER;

CREATE TABLE transaction_tbl(
transid INT UNIQUE,
custid INT,
productname VARCHAR(100),
amount INT);


INSERT INTO transaction_tbl VALUE(1,1000,'Mobile',	50000);
INSERT INTO transaction_tbl VALUE(2,1000,'Laptop',	70000);
INSERT INTO transaction_tbl VALUE(3,1001,'TV',	65000);
INSERT INTO transaction_tbl VALUE(4,1003,'WashingMachine',	45000);
INSERT INTO transaction_tbl VALUE(5,1002,'Microoven',	25000);
INSERT INTO transaction_tbl VALUE(6,1001,'Fridge',	35000);
INSERT INTO transaction_tbl VALUE(7,1000,'Dekstop',	45000);
INSERT INTO transaction_tbl VALUE(8,1002,'Tab',	20000);
INSERT INTO transaction_tbl VALUE(9,1002,'TV',	50000);
INSERT INTO transaction_tbl VALUE(10,1005,'Mobile',	50000);

SELECT * FROM transaction_tbl;

-- INNER JOIN
SELECT * FROM customer  INNER JOIN transaction_tbl  ON customer.custid=transaction_tbl.custid;

-- LEFT  JOIN

SELECT * FROM customer  LEFT  JOIN transaction_tbl  ON customer.custid=transaction_tbl.custid;

SELECT custname FROM customer  LEFT  JOIN transaction_tbl  ON customer.custid=transaction_tbl.custid WHERE transid IS NULL;

-- CROSS JOIN

SELECT count(*) FROM customer;  -- 5
SELECT count(*) from transaction_tbl;  -- 10



-- RIGHT  JOIN
SELECT * FROM customer  RIGHT  JOIN transaction_tbl  ON customer.custid=transaction_tbl.custid;
SELECT * FROM customer  RIGHT  JOIN transaction_tbl  ON customer.custid=transaction_tbl.custid WHERE customer.custid IS NULL;

SELECT * FROM customer c CROSS JOIN transaction_tbl ORDER BY c.custid;


-- SELF JOIN

CREATE TABLE selfjoin_table(
custid INT unique,
custname VARCHAR(100),
city VARCHAR(100),
age INT NOT NULL
);


INSERT INTO selfjoin_table VALUES(1,'Raja','Chennai',25),(2,'karthick','Chennai',27),(3,'Shovin','Hyderabad',23),(4,'Prabha','Bangalore',35),
(5,'Venkat','Hyderabad',40),(6,'Siva','Chennai',35),(7,'Rojer','Hyderabad',35),(8,'Kathir','Hyderabad',25),
(9,'Pankaj','Pune',25),(10,'Yuvaraj','Pune',35);

SELECT * FROM selfjoin_table;

SELECT s1.custname AS customerName1, s2.custname AS customerName2, s1.city
FROM selfjoin_table s1, selfjoin_table s2
WHERE s1.custid != s2.custid
AND s1.city=s2.city
ORDER BY s1.city;



-- VIEW
-- INDEX
-- TCL (COMMIT, ROLLBACK, SAVEPOINT)

-- View is a virtual table


CREATE VIEW cust_trans_data AS
SELECT c.custname, t.productname, c.city FROM customer c LEFT  JOIN transaction_tbl t ON c.custid=t.custid;


CREATE VIEW hyd_cust_name AS
SELECT custname,city FROM CUSTOMER WHERE city=' Hyderabad';

SELECT * FROM hyd_cust_name;

SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES(1006,'Priya','Pune');


--  INDEX

CREATE TABLE customers(
custid INT ,
custname VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);


SHOW INDEXES FROM customers;

CREATE INDEX cust_index ON customers(custid);

INSERT INTO customers 
SELECT * FROM customer;


SELECT * FROM customers WHERE custid=1006;
