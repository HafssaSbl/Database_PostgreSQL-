--1.
UPDATE film
SET language_id = 3
WHERE film_id =2;

select * from film where film_id =2;

--2.
INSERT INTO customer (store_id, address_id, first_name, last_name, email)
VALUES (1, 10, 'Ali', 'Karim', 'ali.karim@example.com');
-- a condition que : store_id existe dans store et address_id existe dans address
-- sinon PostgreSQL renverra une erreur

--3.
DROP TABLE customer_review;
-- a bien été supprimée

--4.
SELECT COUNT(*) AS outstanding_rentals
FROM rental
WHERE return_date IS NULL;

--5.
SELECT DISTINCT f.title, f.rental_rate
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL
ORDER BY f.rental_rate DESC
LIMIT 30;

--6.
   --1.
   SELECT f.title, f.description
	FROM film f
	JOIN film_actor fa ON f.film_id = fa.film_id
	JOIN actor a ON a.actor_id = fa.actor_id
	WHERE a.first_name = 'Penelope' AND a.last_name = 'Monroe'
   AND (f.description ILIKE '%sumo%' OR f.title ILIKE '%sumo%');
   
   --2.
   SELECT title, length, rating
	FROM film
	WHERE length < 60
   AND rating = 'R';

   --3.
   SELECT f.title, p.amount, r.return_date
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN payment p ON r.rental_id = p.rental_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
   AND p.amount > 4.00
   AND r.return_date BETWEEN '2005-07-28' AND '2005-08-01';
   
   --4.
   SELECT f.title, f.description, f.replacement_cost
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
   AND (f.title ILIKE '%boat%' OR f.description ILIKE '%boat%')
   AND f.replacement_cost > 25;
