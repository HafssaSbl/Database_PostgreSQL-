--1.
select * from language;

--2.
select * from film f JOIN language l
ON f.language_id = l.language_id;

--3.
SELECT f.title, f.description, l.name AS language_name
FROM language l
LEFT JOIN film f ON f.language_id = l.language_id;

--4.
CREATE TABLE new_film(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO new_film (name) VALUES
('Inception'),
('The Matrix'),
('Interstellar');

--5.
CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY,        
    film_id INTEGER REFERENCES new_film(id) ON DELETE CASCADE, 
    language_id INTEGER REFERENCES language(language_id),  
    title VARCHAR(255),                    
    score INTEGER CHECK (score BETWEEN 1 AND 10),
    review_text TEXT,                     
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

--6.
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES
  (1, 1, 'Amazing Sci-Fi Thriller', 9, 'I loved the plot twists and the visuals.'),
  (2, 2, 'A Mind-Bending Classic', 10, 'Revolutionary effects and storytelling.');

select * from customer_review;

--7.
SELECT * FROM customer_review WHERE film_id = 1;
DELETE FROM new_film WHERE id = 1;
