CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES buyers(buyer_id),
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO notifications (buyer_id, message, is_read) VALUES
(1, 'Your order has been placed successfully.', TRUE),
(2, 'Your customized gift is being prepared.', TRUE),
(3, 'Order shipped and on the way!', FALSE),
(4, 'Your order has been delivered.', TRUE),
(5, 'New personalized gifts available for Valentine’s Day!', FALSE),
(6, 'Price drop on items in your wishlist.', FALSE),
(7, 'Your cart items are waiting for checkout.', TRUE),
(8, 'Flash sale started! Grab your favorite gifts.', FALSE),
(9, 'Your review was posted successfully.', TRUE),
(10, 'Special discount for your birthday month!', FALSE);

select * from notifications;