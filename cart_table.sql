CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyers(buyer_id),
    product_id INT REFERENCES products(product_id),
    quantity INT   
);
SELECT * FROM cart;
INSERT INTO cart (buyer_id, product_id, quantity) VALUES
(1, 2, 1),
(1, 5, 2),
(2, 3, 1),
(3, 1, 3),
(4, 7, 1),
(5, 4, 2),
(6, 6, 1),
(7, 8, 2),
(8, 9, 1),
(9, 10, 1);