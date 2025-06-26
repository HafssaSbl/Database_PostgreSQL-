--1.
	SELECT *
	FROM rental
	WHERE return_date IS NULL;

--2.
	SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS outstanding_rentals
	FROM rental r
	JOIN customer c ON r.customer_id = c.customer_id
	WHERE r.return_date IS NULL
	GROUP BY c.customer_id, c.first_name, c.last_name
	ORDER BY outstanding_rentals DESC;

--3.
	SELECT f.title
	FROM film f
	JOIN film_actor fa ON f.film_id = fa.film_id
	JOIN actor a ON fa.actor_id = a.actor_id
	JOIN film_category fc ON f.film_id = fc.film_id
	JOIN category c ON fc.category_id = c.category_id
	WHERE a.first_name = 'Joe' AND a.last_name = 'Swank'
  	AND c.name = 'Action';
