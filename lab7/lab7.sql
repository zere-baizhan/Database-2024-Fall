--1
CREATE TABLE countires(
    id SERIAL PRIMARY KEY ,
    name VARCHAR(100) NOT NULL
);
CREATE INDEX id_countries_name ON countires(name);

--2
CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2)
);
CREATE INDEX ix_employees_name_surname ON employees(name,surname);

--3
CREATE UNIQUE INDEX id_employees_salary on employees(salary);
--4
CREATE INDEX id_employee_name_substr ON employees(name);
--5
CREATE TABLE departaments(
    departament_id SERIAL PRIMARY KEY,
    budget DECIMAL(10,2)
);

--INDEX
CREATE INDEX id_departament_budget ON departaments(departament_id,budget);
CREATE INDEX idx_employee_salary_filter ON employees(department_id, salary);

--ALTER TABLE employees ADD COLUMN department_id INT;

INSERT INTO countires VALUES(1,'Kazakhstan'),(2,'USA');

EXPLAIN SELECT * FROM countires
WHERE name = 'string'