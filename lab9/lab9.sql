--1
CREATE FUNCTION inc(val integer) RETURNS integer AS $$
    BEGIN
    RETURN val+10;
    END; $$
LANGUAGE PLPGSQL;

--2
CREATE FUNCTION compare_numbers(a NUMERIC, b NUMERIC) RETURNS VARCHAR AS $$
BEGIN
    IF a = b THEN
        RETURN 'EQUAL';
    ELSIF a > b THEN
        RETURN 'a GREATEST';
    ELSE
        RETURN 'b GREATEST';
    END IF;
END; $$
LANGUAGE PLPGSQL;


--3
CREATE FUNCTION number_series (n INTEGER)
RETURNS SETOF INTEGER AS $$
BEGIN
    FOR value IN 1..n LOOP
        RETURN NEXT value;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE PLPGSQL;

--4
CREATE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(id INTEGER,name TEXT,"position" TEXT,salary NUMERIC) AS $$
    BEGIN
        RETURN QUERY
        SELECT id,name,"position",salary
        FROM employees
        WHERE employees.first_name=emp_name;
end;
$$ LANGUAGE PLPGSQL;

--5
CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE (product_id INTEGER, product_name VARCHAR(100), price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT products.product_id, products.product_name, products.price
    FROM products
    WHERE products.category = category_name;
END;
$$ LANGUAGE PLPGSQL;



--6
CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INTEGER) RETURNS NUMERIC AS $$
DECLARE
    salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT employees.salary INTO salary
    FROM employees
    WHERE employee_id = emp_id;

    bonus := salary * 0.10;
    RETURN bonus;
END;
$$ LANGUAGE PLPGSQL;

--6.2
CREATE FUNCTION update_salary(emp_id INTEGER) RETURNS VOID AS $$
DECLARE
    bonus INTEGER;
BEGIN
    bonus:=calculate_bonus(emp_id);
    UPDATE employees
    SET salary=salary+bonus
    WHERE employee_id=emp_id;
end;
$$ LANGUAGE PLPGSQL;

--7
CREATE OR REPLACE PROCEDURE complex_calculation(
    in_num INTEGER,
    in_text VARCHAR,
    OUT result TEXT
) AS $$
DECLARE
    num_res INTEGER;
    str_res VARCHAR;
BEGIN
    <<main_block>>
    BEGIN
        <<numeric_block>>
        BEGIN
            num_res:=in_num*3;
        end numeric_block;
        <<str_block>>
        BEGIN
            str_res:=CONCAT(UPPER(in_text),'calculate');
        end str_block;

        result:=CONCAT('Num:',num_res,'Text: ',str_res);
end main_block;
end;
$$ LANGUAGE PLPGSQL;

DO $$
DECLARE
    result TEXT;
BEGIN
    CALL complex_calculation(12,'testing',result);
    RAISE NOTICE 'The result is: %', result;
end;
$$