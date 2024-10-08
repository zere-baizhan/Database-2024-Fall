CREATE TABLE warehouses(
	code INTEGER PRIMARY KEY,
	location VARCHAR(255) NOT NULL,
	capacity INTEGER NOT NULL);
CREATE TABLE boxes(
	code CHAR(4) PRIMARY KEY,
	contents VARCHAR(255) NOT NULL,
	value REAL NOT NULL,
	warehouse INTEGER NOT NULL,
	FOREIGN KEY (warehouse) REFERENCES warehouses(code)
);

INSERT INTO warehouses(code,location,capacity) VALUES(1,'Chicago',3);
INSERT INTO warehouses(code,location,capacity) VALUES(2,'Chicago',4);
INSERT INTO warehouses(code,location,capacity) VALUES(3,'New York',7);
INSERT INTO warehouses(code,location,capacity) VALUES(4,'Los Angeles',2);
INSERT INTO warehouses(code,location,capacity) VALUES(5,'San Francisco',8);

INSERT INTO boxes(code, contents, value, warehouse) VALUES
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);
