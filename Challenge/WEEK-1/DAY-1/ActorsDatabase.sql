CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL
);

SELECT COUNT(*) FROM actors;

INSERT INTO actors (first_name, last_name, birth_date)
VALUES ('hafssa', 'sabil', '06-05-2001');
