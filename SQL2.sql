use cust;
select * from Customer;
-- SELECT , UPDATE , DELETE , CONSTRAINS ( UNIUQ, NOT NULL, PRIMARY KEY, FOREIGN KEY, DEFAULT, CHECK)

SELECT  city,first_name, gender, age 
FROM customer;

SELECT * FROM customer WHERE city="hyderabad" and gender='M' and first_name='Siva';

select * from customer where age > 25 or gender='M';

select * from customer where age=30;

SELECT * FROM CUSTOMER WHERE (city='Hyderabad' and gender='F') or (city='Bangalore' and age > 25);