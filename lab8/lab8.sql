--CREATE DATABASE lab8;

--2
CREATE TABLE salesman(
    salesman_id INT primary key,
    name varchar(50),
    city varchar(50),
    commission DECIMAL(3,2)
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

--INSERT
INSERT INTO salesman VALUES
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',NULL,0.12),
(5007,'Paul Adam','Rome',0.13);

INSERT INTO customer VALUES
(3002,'Nick Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',NULL,5005),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis Hen','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002);

INSERT INTO orders VALUES
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2500.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001);
--3
CREATE ROLE junoir_dev LOGIN;

--4
CREATE VIEW vista1 AS SELECT name FROM salesman WHERE city='New York';
SELECT * FROM vista1;

--5
CREATE VIEW vista2 AS SELECT ord_no,purch_amt,ord_date,cust_name,name FROM orders
JOIN customer c on orders.customer_id = c.customer_id JOIN salesman s on c.salesman_id = s.salesman_id;
SELECT * FROM vista2;
GRANT ALL PRIVILEGES ON DATABASE lab8 TO junoir_dev;

--6
CREATE VIEW highest_grade AS SELECT * FROM customer WHERE customer.grade=(SELECT MAX(grade) FROM customer);
SELECT * FROM highest_grade;
GRANT SELECT ON highest_grade TO junoir_dev;

--7
CREATE VIEW number_salesman AS SELECT COUNT(salesman_id) AS number_of_salesmen,city FROM salesman GROUP BY city;
SELECT * FROM number_salesman;

--8
CREATE VIEW more_customer AS
SELECT salesman.salesman_id,salesman.name,salesman.city,COUNT(c.customer_id) AS num_of_customers
FROM salesman JOIN customer c ON salesman.salesman_id = c.salesman_id
GROUP BY salesman.salesman_id, salesman.name, salesman.city HAVING COUNT(c.customer_id) > 1;
SELECT * FROM more_customer;

--
CREATE ROLE intern inherit;
GRANT junoir_dev to intern;