--1.
SELECT * FROM customer;

--2.
SELECT first_name || ' ' || last_name AS full_name FROM customer;

--3.
SELECT DISTINCT create_date FROM customer;

--4.
SELECT * FROM customer ORDER BY first_name DESC;

--5.
SELECT film_id, title, description, release_year, rental_rate
FROM film
ORDER BY rental_rate ASC;

--6.
SELECT address, phone
FROM address
WHERE district = 'Texas';

--7.
SELECT *
FROM film
WHERE film_id IN (15, 150);

--8.
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title = 'Your Favorite Title';

--9.
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title ILIKE 'Yo%';

--10.
SELECT *
FROM film
ORDER BY rental_rate ASC
LIMIT 10;

--11.
SELECT *
FROM film
ORDER BY rental_rate ASC
OFFSET 10
LIMIT 10;

--Bonus.
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY rental_rate ASC) AS rn
    FROM film
) AS ranked
WHERE rn BETWEEN 11 AND 20;

--12.
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id ASC;

--13.
SELECT *
FROM film
WHERE film_id NOT IN (SELECT DISTINCT film_id FROM inventory);

--14.
SELECT ci.city, co.country
FROM city ci
JOIN country co ON ci.country_id = co.country_id;

--Bonus.
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date, p.staff_id
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.staff_id ASC;
