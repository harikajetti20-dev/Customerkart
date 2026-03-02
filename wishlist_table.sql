CREATE TABLE wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyers(buyer_id),
    product_id INT REFERENCES products(product_id)   
);

INSERT INTO wishlist (buyer_id, product_id) VALUES
(1, 3),
(1, 5),
(2, 1),
(2, 7),
(3, 2),
(4, 6),
(5, 4),
(6, 8),
(7, 9),
(8, 10);

select * from wishlist;