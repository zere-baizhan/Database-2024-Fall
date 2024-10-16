--1
CREATE  DATABASE  lab5;

--2
CREATE TABLE salesman(
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    comission DECIMAL(5,2)
);

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO salesman(salesman_id, name, city, comission) VALUES
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',NULL,0.12),
(5007,'Paul Adam','Rome',0.13)
ON CONFLICT (salesman_id) DO NOTHING;

INSERT INTO customer(customer_id, cust_name, city, grade, salesman_id) VALUES
(3002,'Nick Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',NULL,5005),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002)
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001)
ON CONFLICT (ord_no) DO NOTHING;


--3
SELECT SUM(purch_amt) FROM orders;

--4
SELECT AVG(purch_amt) FROM orders;

--5
SELECT COUNT(cust_name) from customer;

--6
SELECT MIN(purch_amt) from orders;

--7
SELECT * FROM customer WHERE cust_name LIKE '%b';

--8
SELECT * FROM orders JOIN customer ON orders.customer_id=customer.customer_id WHERE customer.city='New York';

--9
SELECT * from customer JOIN orders ON customer.customer_id=orders.customer_id WHERE orders.purch_amt>10;

--10
SELECT SUM(grade) from customer;

--11
SELECT * FROM customer WHERE cust_name IS NOT NULL;

--12
SELECT MAX(grade) from customer;