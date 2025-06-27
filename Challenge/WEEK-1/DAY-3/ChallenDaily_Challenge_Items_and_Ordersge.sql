--1.2.
CREATE TABLE product_orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    quantity INT DEFAULT 1,
    order_id INT,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES product_orders(order_id) ON DELETE CASCADE
);

--3.
CREATE OR REPLACE FUNCTION get_order_total(p_order_id INT)
RETURNS NUMERIC(10,2) AS $$
DECLARE
    total NUMERIC(10,2);
BEGIN
    SELECT SUM(price * quantity)
    INTO total
    FROM items
    WHERE order_id = p_order_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;

--BONUS.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL
);

-- Ajout d'une colonne user_id à la table des commandes

ALTER TABLE product_orders
ADD COLUMN user_id INT,
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;

CREATE OR REPLACE FUNCTION get_user_order_total(p_user_id INT, p_order_id INT)
RETURNS NUMERIC(10,2) AS $$
DECLARE
    total NUMERIC(10,2);
BEGIN
    -- Vérifie que la commande appartient bien à l'utilisateur
    SELECT SUM(i.price * i.quantity)
    INTO total
    FROM items i
    JOIN product_orders po ON i.order_id = po.order_id
    WHERE po.order_id = p_order_id AND po.user_id = p_user_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;

INSERT INTO users (username) VALUES ('hafssa');

INSERT INTO product_orders (user_id) VALUES (1);

INSERT INTO items (name, price, quantity, order_id) VALUES 
('Book', 10.00, 2, 1),
('Pen', 2.50, 3, 1);

SELECT get_order_total(1); -- devrait retourner 10*2 + 2.5*3 = 25.5

SELECT get_user_order_total(1, 1); -- même résultat si bon utilisateur
