CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO payments (order_id, payment_method, payment_status) VALUES
(31, 'UPI', 'Success'),
(32, 'Credit Card', 'Success'),
(33, 'Debit Card', 'Success'),
(34, 'Cash on Delivery', 'Pending'),
(35, 'UPI', 'Success'),
(36, 'Net Banking', 'Failed'),
(37, 'Credit Card', 'Success'),
(38, 'UPI', 'Success'),
(39, 'Debit Card', 'Pending'),
(40, 'Cash on Delivery', 'Success');

select * from payments;