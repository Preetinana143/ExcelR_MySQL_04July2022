-- Database is a collections of table

-- QUERY TYPE
-- DDL - Data Definition Language
-- 		CREATE , ALTER, DROP, TRUNCATE
-- DML - Data MANUPLUATION Language:
-- 		INSERT, UPDATE, DELETE
-- DCL - DATA CONTROL LANGUAGE:
-- 		GRANT, REVOKE
-- TCL - TRANSACTION CONTROL LANGUAGE
-- 		COMMIT, ROLLBACK, SAVEPOINT
-- DQL - DATA QUERY LANGUAGE
-- 		SELECT


CREATE DATABASE mydb;

use mydb;

CREATE DATABASE customer_db; 

DROP DATABASE customer_db;

CREATE TABLE customer(
custid INT,
custname VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(25)
);

DESC customer;   -- Describe

SHOW CREATE TABLE customer;

INSERT INTO customer VALUES(1000,'Suraya','M',45,'Chennai'),(1001,'Dhoni','M',40,'Jarkant'),(1002,'Kholi','M',35,'Mumbai'),
(1003,'Harshavarthini','F',7,'Chennai');

SELECT * FROM customer;

INSERT INTO customer VALUES(1004,'Shivani','F',11,'Chennai');

INSERT INTO CUSTOMER VALUES(1005,'Arun Vetri Maran','M',4,'Chennai'),(1006,'Arum Mozhi Varman','M',2,'Chennai');

INSERT INTO CUSTOMER(custid, custname, gender,city) values(1007,'Ashwin','M','Bangalore');

INSERT INTO customer(age, custname, city, custid, gender) VALUES(100,'aveek','Delhi',1008,'M');

SELECT custname, city, age FROM customer;

SELECT * FROM customer WHERE city='Chennai';

SELECT * FROM customer WHERE city != 'Chennai';

SELECT * FROM customer WHERE gender='M';
SELECT * FROM customer WHERE gender='F';

SELECT * FROM CUSTOMER WHERE AGE < 30;
SELECT * FROM CUSTOMER WHERE AGE > 30;

SELECT * FROM CUSTOMER WHERE gender='M' and city !='Chennai' ;

SELECT custname,gender,city FROM customer WHERE gender='F' or city != 'Chennai';




