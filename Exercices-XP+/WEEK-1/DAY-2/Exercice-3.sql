CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    item_id INT REFERENCES items(id),
    quantity_purchased INT NOT NULL
);

select * from purchases;


-- Scott Scott bought one fan
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id_customers FROM customers WHERE first_name = 'Scott' AND last_name = 'Scott'),
    (SELECT id_items FROM items WHERE small_desk ILIKE '%fan%'),
    1
);

-- Melanie Johnson bought ten large desks
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id_customers FROM customers WHERE first_name = 'Melanie' AND last_name = 'Johnson'),
    (SELECT id_items FROM items WHERE small_desk ILIKE '%large desk%'),
    10
);

-- Greg Jones bought two small desks
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id_customers FROM customers WHERE first_name = 'Greg' AND last_name = 'Jones'),
    (SELECT id_items FROM items WHERE small_desk ILIKE '%small desk%'),
    2
);

SELECT 
    p.id AS purchase_id,
    c.first_name,
    c.last_name,
    p.quantity_purchased
FROM purchases p
JOIN customers c ON p.customer_id = c.id_customers;

SELECT * FROM purchases WHERE customer_id = 5;

SELECT * FROM purchases
WHERE item_id IN (
    SELECT item_id FROM items 
    WHERE small_desk ILIKE '%large desk%' OR small_desk ILIKE '%small desk%'
);


SELECT 
    c.first_name,
    c.last_name,
    i.small_desk AS item_name
FROM purchases p
JOIN customers c ON p.customer_id = c.id_customers
JOIN items i ON p.item_id = i.id_items;

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 5); --oui