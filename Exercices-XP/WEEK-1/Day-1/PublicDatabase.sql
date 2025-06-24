CREATE TABLE items (
  id_items SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price INTEGER
);

CREATE TABLE customers (
  id_customers SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(300)
);


INSERT INTO items (name, price)
VALUES
  ('Small Desk', 100),
  ('Large Desk', 300),
  ('Fan', 80);
  
INSERT INTO customers(first_name,last_name) VALUES ('Greg','Jones'),('Sandra','Jones'),('Scott','Scott'),('Trevor','Green'),('Melanie','Johnson');

select * from items;
select * from customers;

select * from items 
WHERE price > 80;

select * from items 
WHERE price <= 300;

select * from customers
WHERE last_name = 'Smith'

select * from customers
WHERE last_name = 'Jones' 

select * from customers
WHERE first_name != 'Scott'
