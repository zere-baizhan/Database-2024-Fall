CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departaments(
    departament_id SERIAL PRIMARY KEY,
    departament_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE  TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_num VARCHAR(20),
    salary INTEGER,
    departament_id INTEGER REFERENCES departaments
);
--INSERTING
INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Maple St', '90210', 'Beverly Hills', 'CA'),
    ('456 Oak St', '30301', 'Atlanta', 'GA'),
    ('789 Pine St', '10001', 'New York', 'NY'),
    ('321 Elm St', '60614', 'Chicago', 'IL');

INSERT INTO departaments (departament_name, budget, location_id)
VALUES
    ('Sales', 500000, 1),
    ('Engineering', 1200000, 2),
    ('Marketing', 300000, 3),
    ('Finance', 700000, 4);

INSERT INTO employees (first_name, last_name, email, phone_num, salary, departament_id)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-1234', 60000, 1),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 85000, 2),
    ('Michael', 'Johnson', 'michael.j@example.com', '555-8765', 75000, 3),
    ('Emily', 'Davis', 'emily.d@example.com', '555-4321', 90000, 4),
    ('Chris', 'Brown', 'chris.b@example.com', '555-6789', 95000, 1),
    ('Jessica', 'Wilson', 'jessica.w@example.com', '555-1357', 82000, 2);
--3
SELECT employees.first_name,employees.last_name,employees.departament_id,departaments.departament_name FROM employees JOIN departaments ON employees.departament_id = departaments.departament_id;

--4
SELECT employees.first_name,employees.last_name,employees.departament_id,departaments.departament_name FROM employees JOIN departaments ON employees.departament_id = departaments.departament_id WHERE employees.departament_id IN (1,2);

--5
SELECT employees.first_name,employees.last_name,departaments.departament_name,locations.city,locations.state_province FROM employees JOIN departaments ON employees.departament_id=departaments.departament_id JOIN locations ON departaments.location_id = locations.location_id

--6
SELECT departaments.departament_id,departaments.departament_name,employees.first_name,employees.last_name FROM departaments LEFT JOIN employees ON departaments.departament_id = employees.departament_id;

--7
SELECT employees.first_name,employees.last_name,employees.departament_id,departaments.departament_name FROM employees LEFT JOIN departaments ON employees.departament_id = departaments.departament_id;