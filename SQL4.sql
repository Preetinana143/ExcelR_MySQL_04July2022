 use mydb;
 -- composite primary key 
 
 create table composite_primary_table(
 orderid INT,
 productId INT,
 custId INT,
 productname VARCHAR(100),
 amount DECIMAL(32,2),
 ordered_date DATE,
 PRIMARY KEY (orderId,ProductId)
 );
 
 INSERT INTO composite_primary_table VALUES(1,100,1000,'mobile',30000,current_date());
 SELECT * FROM composite_primary_table;
INSERT INTO composite_primary_table VALUES(1,101,1000,'Laptop',70000,current_date());
 INSERT INTO composite_primary_table VALUES(2,100,1000,'mobile',30000,current_date());
 INSERT INTO composite_primary_table VALUES(2,101,1000,'Laptop',70000,current_date());


-- Foreign key

 create table foreignkey_table(
 orderid INT ,
 productId INT,
 custid INT,
 productname VARCHAR(100),
 amount DECIMAL(32,2),
 ordered_date DATE,
 PRIMARY KEY (orderId,ProductId),
 FOREIGN KEY (custid) REFERENCES primarykey_table(custid)
 );
 
 SELECT * FROM primarykey_table;
 
INSERT INTO foreignkey_table VALUES(1,100,1000,'mobile',30000,current_date());
 SELECT * FROM foreignkey_table;
INSERT INTO foreignkey_table VALUES(1,101,1001,'Laptop',70000,current_date());
 INSERT INTO foreignkey_table VALUES(2,100,1002,'mobile',30000,current_date());
 INSERT INTO foreignkey_table VALUES(2,101,1003,'Laptop',70000,current_date());
  INSERT INTO foreignkey_table VALUES(2,102,1003,'Tv',70000,current_date());
  
  
   create table foreignkey_table_new(
 orderid INT ,
 productId INT,
 userid INT,
 productname VARCHAR(100),
 amount DECIMAL(32,2),
 ordered_date DATE,
 CONSTRAINT pk_ord_prod PRIMARY KEY (orderId,ProductId),
CONSTRAINT fk_order FOREIGN KEY (userid) REFERENCES primarykey_table(custid)
 );
 
 INSERT INTO foreignkey_table_new VALUES(1,100,1000,'mobile',30000,current_date());
 SELECT * FROM foreignkey_table_new;
INSERT INTO foreignkey_table_new VALUES(1,101,1001,'Laptop',70000,current_date());
 INSERT INTO foreignkey_table_new VALUES(2,100,1002,'mobile',30000,current_date());
 INSERT INTO foreignkey_table_new VALUES(2,101,1003,'Laptop',70000,current_date());
INSERT INTO foreignkey_table_new VALUES(2,103,1005,'Tv',70000,current_date());
  
  ALTER TABLE foreignkey_table_new
  DROP foreign key fk_order;
  
  ALTER TABLE foreignkey_table_new
  ADD CONSTRAINT fk_foreign_id FOREIGN KEY (userid) REFERENCES primarykey_table(custid);
  
  update foreignkey_table_new set userid=1000 WHERE userid=1005;
  
  
  -- DEFAULT 
  
CREATE TABLE default_table(
 custid INT UNIQUE,
 custname VARCHAR(100) NOT NULL,
 gender CHAR(1),
 city VARCHAR(100) DEFAULT 'Pune'
 );
 
 INSERT INTO default_table VALUES(1000,'Anand','M','Mumbai');
 SELECT * FROM default_table;
 INSERT INTO default_table(custid,custname,gender) VALUES(1001,'Anik','M');
  INSERT INTO default_table(custid,custname,gender)  VALUES(1002,'Akanksha','F');
   INSERT INTO default_table VALUES(1004,'Seema','F','');

-- check 


CREATE TABLE check_table(
 custid INT UNIQUE,
 custname VARCHAR(100) NOT NULL,
 gender CHAR(1),
 age INT CHECK ( age > 0 and age <= 100),
 city VARCHAR(100) DEFAULT 'Pune'
 );
 
 INSERT INTO check_table VALUES(1000,'Anjana','F',25,'Hyderabad');
 SELECT * FROM check_table;
  INSERT INTO check_table VALUES(1001,'Ankita','F',25,'Hyderabad');

-- Auto increment 

CREATE TABLE auto_increment_table(
 custid INT UNIQUE auto_increment,
 custname VARCHAR(100) NOT NULL,
 gender CHAR(1),
 city VARCHAR(100) DEFAULT 'Pune'
 );
 
 INSERT INTO auto_increment_table(custname,gender,city) VALUES('Dharanija','F','Bangalore');
 SELECT * FROM auto_increment_table;
  INSERT INTO auto_increment_table(custname,gender,city) VALUES('Himanshu','M','Pune');
  INSERT INTO auto_increment_table(custname,gender,city) VALUES('Indrani','F','Hyderabad');

DELETE FROM auto_increment_table WHERE custid=3;
  INSERT INTO auto_increment_table(custname,gender,city) VALUES('Jhinuk','M','Hyderabad');

-- -----------------------------------------------------------

-- JOINS 

-- INNER JOIN
-- OUTER JOIN
-- 	   LEFT OUTER JOIN
--     RIGHT OUTER JOIN
--     CROSS JOIN
-- SELF JOIN

 -- INNER JOIN
 
 CREATE TABLE CUSTOMER (
 CUSTID INT,
 custname varchar(100),
 city VARCHAR(100)
 );
 
 INSERT INTO CUSTOMER VALUES(1000,'Raghul Ramesh','Chennai');
INSERT INTO CUSTOMER VALUES(1001,'Ashwin Sekar','Bangalore');
INSERT INTO CUSTOMER VALUES(1002,'Aveek Mishra','Pune');
INSERT INTO CUSTOMER VALUES(1003,'Pankaj kumar','Delhi');
INSERT INTO CUSTOMER VALUES(1004,'Jitendra kumar','Hyderabad');

SELECT * FROM CUSTOMER;

CREATE TABLE transaction_tbl(
transid INT,
custid int,
productname varchar(100),
amount int
);

INSERT INTO TRANSACTION_TBL VALUES(1,1000,'Laptop',5000);
INSERT INTO TRANSACTION_TBL VALUES(2,1002,'Mobile',20000);
INSERT INTO TRANSACTION_TBL VALUES(3,1001,'Toys',2000);
INSERT INTO TRANSACTION_TBL VALUES(4,1001,'Chocolates',500);
INSERT INTO TRANSACTION_TBL VALUES(5,1003,'Books',1200);
INSERT INTO TRANSACTION_TBL VALUES(6,1000,'TV',65000);
INSERT INTO TRANSACTION_TBL VALUES(7,1000,'Table',3000);
INSERT INTO TRANSACTION_TBL VALUES(8,1002,'Toys',10000);
INSERT INTO TRANSACTION_TBL VALUES(9,1002,'Dekstop',50000);
INSERT INTO TRANSACTION_TBL VALUES(10,1005,'Software',100000);

SELECT * FROM TRANSACTION_TBL;


SELECT * FROM customer c INNER JOIN transaction_tbl t ON c.custid=t.custid ;


-- LEFT JOIN

SELECT * FROM customer c LEFT  JOIN transaction_tbl t ON c.custid=t.custid;
SELECT custname FROM customer c LEFT  JOIN transaction_tbl t ON c.custid=t.custid WHERE transid is NULL;


-- RIGHT JOIN
SELECT * FROM customer c RIGHT  JOIN transaction_tbl t ON c.custid=t.custid;

SELECT custid, count(*) from transaction_tbl group by custid order by count(*) DESC LIMIT 2;

-- WINDOWING FUNTION ( row_number, rank, dense_rank)