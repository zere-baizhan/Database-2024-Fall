--1
START TRANSACTION;

INSERT INTO orders(order_id,customer_id ,order_date ,quantity,book_id)
VALUES(1,101,CURRENT_DATE,2,1);

UPDATE books SET quantity=quantity-2 WHERE book_id=1;

COMMIT;

--2
BEGIN;
DO $$
DECLARE
    available_quantity INTEGER;
BEGIN
    SELECT quantity INTO available_quantity FROM books WHERE book_id=3;

    IF available_quantity < 10 THEN
        RAISE NOTICE 'not enough.rollback';
        ROLLBACK;
    ELSE
        INSERT INTO orders(book_id,customer_id,order_date,quantity)
        VALUES (3,102,CURRENT_DATE,10);

        UPDATE books SET quantity=quantity-10 WHERE book_id=3;
        COMMIT;
    end if;
end;$$;

--3
--s1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

UPDATE books SET price=price+5 WHERE book_id=2;

--s2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

SELECT price FROM books WHERE book_id=2;
SELECT price FROM books WHERE book_id=2;

COMMIT;

--4
BEGIN;

UPDATE customers SET email='googles@gmail.com' WHERE customer_id=101;

COMMIT ;

SELECT customer_id,email FROM customers WHERE customer_id=101;



