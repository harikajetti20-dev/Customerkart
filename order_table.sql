CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyers(buyer_id),
    total_amount NUMERIC(10,2),
    status VARCHAR(50),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (buyer_id, total_amount, status) VALUES
(1, 799.00, 'Pending'),
(2, 599.00, 'Confirmed'),
(3, 1499.00, 'Shipped'),
(4, 499.00, 'Delivered'),
(5, 299.00, 'Pending'),
(6, 399.00, 'Confirmed'),
(7, 199.00, 'Delivered'),
(8, 699.00, 'Shipped'),
(9, 899.00, 'Pending'),
(10, 549.00, 'Confirmed');

select * from orders;