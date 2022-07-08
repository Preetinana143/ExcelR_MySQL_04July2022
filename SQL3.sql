use mydb;

CREATE TABLE primary_table(
id INT primary key,     -- primary key = unique + not null
name varchar(100) NOT NULL,
gender CHAR(1),
age int CHECK (age between 0 and 100),
city VARCHAR(100) DEFAULT 'HARIYANA',
country VARCHAR(100) CHECK (country IN ('INDIA','SINGAPORE','CANADA'))
);

INSERT INTO primary_table VALUES(1000,'umesh','M',25,'pune','INDIA');
INSERT INTO primary_table(id,name,gender,age,city,country) VALUES(1001,'ashwin','M',26,'chennai','INDIA');

SELECT * FROM primary_table;

-- Foreign key is used to link one or more table together
-- it is also called as refrential key
-- ** A foreign key matches the primary key field of anothe table

CREATE TABLE foreign_table(
f_id INT ,     -- primary key = unique + not null
name varchar(100) NOT NULL,
gender CHAR(1),
age int CHECK (age between 0 and 100),
city VARCHAR(100) DEFAULT 'HARIYANA',
country VARCHAR(100) CHECK (country IN ('INDIA','SINGAPORE','CANADA')),
FOREIGN KEY (f_id) REFERENCES primary_table(id)
);


INSERT INTO foreign_table VALUES(1000,'bala','M',35,'Bangalore','INDIA');
INSERT INTO foreign_table VALUES(1002,'vijay','M',35,'Bangalore','INDIA'); -- error

INSERT INTO foreign_table VALUES(1001,'vijay','M',35,'Bangalore','INDIA');
SELECT * FROM foreign_table;

-- ----------------------------------------------------------------------------


CREATE TABLE composite_primary_table(
order_id INT,
product_id INT,
amount INT,
PRIMARY KEY (order_id, product_id)
);

INSERT INTO composite_primary_table VALUES(100,1000,5000);

SELECT * FROM composite_primary_table;

INSERT INTO composite_primary_table VALUES(100,1001,5000);

INSERT INTO composite_primary_table VALUES(101,1000,5000);

