--1.
SELECT DISTINCT f.film_id, f.title, f.rating
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
WHERE f.rating IN ('G', 'PG')
  AND r.rental_id IS NULL;

--2.
CREATE TABLE waiting_list (
    waiting_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    inventory_id INT NOT NULL,
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_inventory FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

--3.
SELECT
    wl.inventory_id,
    COUNT(wl.customer_id) AS waiting_count
FROM waiting_list wl
GROUP BY wl.inventory_id;

INSERT INTO waiting_list (customer_id, inventory_id) VALUES
(1, 101),
(2, 101),
(3, 102);
