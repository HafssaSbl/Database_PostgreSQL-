select * from customers;

--Fetch the last 2 customers in alphabetical order (A-Z) – exclude ‘id’ from the results.

select * from customers
order by last_name ASC
LIMIT 2 OFFSET(
  SELECT COUNT(*) -2 FROM customers
)

--Use SQL to delete all purchases made by Scott.

DELETE FROM purchases
WHERE customer_id IN (
  SELECT id_customers FROM customers WHERE first_name = 'Scott'
);

--Does Scott still exist in the customers table, even though he has been deleted? Try and find him.

SELECT * FROM customers WHERE first_name = 'Scott';

-- Use SQL to find all purchases. Join purchases with 
--the customers table, so that Scott’s order will 
--appear, although instead of the customer’s first and last name, you should only see empty/blank. (Which kind of join should you use?).

select c.first_name, c.last_name, p.customer_id ,p.id from purchases p
LEFT JOIN customers c on p.customer_id = c.id_customers;

-- Use SQL to find all purchases. Join purchases with 
-- the customers table, so that Scott’s order will 
-- NOT appear. (Which kind of join should you use?)

SELECT 
    p.id AS purchase_id,
    c.first_name,
    c.last_name,
    p.item_id,
    p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id_customers;