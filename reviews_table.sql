CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyers(buyer_id),
    product_id INT REFERENCES products(product_id),
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO reviews (buyer_id, product_id, rating, comment) VALUES
(1, 1, 5, 'Amazing quality! Loved the customization.'),
(2, 2, 4, 'Good product and fast delivery.'),
(3, 3, 5, 'Perfect gift for birthday.'),
(4, 4, 3, 'Decent but delivery was late.'),
(5, 5, 4, 'Nice design and packaging.'),
(6, 6, 5, 'Best personalized frame I bought.'),
(7, 7, 4, 'Good but price is slightly high.'),
(8, 8, 5, 'Loved it! Highly recommended.'),
(9, 9, 3, 'Average quality.'),
(10, 10, 5, 'Beautiful gift and quick delivery.');

select * from reviews;