CREATE TABLE countries(
	country_id SERIAL PRIMARY KEY,
	country_name VARCHAR(50),
	region_id INT,
	population INT
);