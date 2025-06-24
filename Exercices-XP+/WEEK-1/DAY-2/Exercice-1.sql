CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year INTEGER,
    language_id INTEGER NOT NULL,
    rental_duration INTEGER NOT NULL DEFAULT 3,
    rental_rate NUMERIC(4,2) NOT NULL DEFAULT 4.99,
    length INTEGER,
    replacement_cost NUMERIC(5,2) NOT NULL DEFAULT 19.99,
    rating VARCHAR(10) DEFAULT 'G',
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    special_features TEXT[],
    fulltext TSVECTOR
);

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    district VARCHAR(50),
    city_id INTEGER,
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    store_id INTEGER NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50),
    address_id INTEGER NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    create_date DATE DEFAULT CURRENT_DATE,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- 1.
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

-- 2.
SELECT *
FROM film
WHERE rating IN ('G', 'PG-13');

-- 3.
SELECT title, length, rental_rate, rating
FROM film
WHERE rating IN ('G', 'PG-13')
  AND length < 120
  AND rental_rate < 3.00
ORDER BY title ASC;

-- 4.
SET first_name = 'Hafssa',
    last_name = 'Sabil',
    email = 'hafssa@example.com'
WHERE customer_id = 1;

-- 5.
UPDATE address
SET address = '123 Rue de Casablanca',
    district = 'Casablanca',
    postal_code = '20000',
    phone = '0600000000'
WHERE address_id = (
    SELECT address_id FROM customer WHERE customer_id = 1
);

