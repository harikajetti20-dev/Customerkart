CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price NUMERIC(10,2)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(31, 1, 1, 499.00),
(31, 2, 2, 299.00),
(32, 3, 1, 799.00),
(33, 4, 3, 199.00),
(34, 5, 1, 999.00),
(35, 6, 2, 149.00),
(36, 7, 1, 349.00),
(37, 8, 2, 249.00),
(38, 9, 1, 599.00),
(40, 10, 1, 899.00);

SELECT order_id FROM orders;

select * from order_items;