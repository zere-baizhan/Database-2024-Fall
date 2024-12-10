CREATE TABLE books(
    book_id INT PRIMARY KEY,
    title VARCHAR(20),
    author VARCHAR(30),
    price DECIMAL,
    quantity INT
    );

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INTEGER REFERENCES customers,
    order_date DATE,
    quantity INT,
    book_id INTEGER REFERENCES books
);

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR,
    email VARCHAR
);

INSERT INTO books VALUES
(1, 'Cat Tail', 'A.Smith', 40.00, 10),
(2,'Dog Years','M.Narath',25.00,4),
(3,'Error Book','J.Kate',56.00,6);

INSERT INTO customers VALUES
(101,'Andrew','andrew@gmail.com'),
(102,'Riley','heavenly@gmail.com'),
(103,'Aza','paza@gmail.com');

INSERT INTO orders VALUES
(201,101,'2024-12-01',3,1),
(202,102,'2024-03-12',6,3),
(203,103,'2023-11-11',4,2);

INSERT INTO books VALUES (4,'IDK','E.Major',56.00,13);