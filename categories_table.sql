CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO categories (category_name) VALUES
('Birthday Gifts'),
('Anniversary Gifts'),
('Wedding Gifts'),
('Valentine Gifts'),
('Personalized Gifts'),
('Photo Frames'),
('Handmade Crafts'),
('Toys & Kids Gifts'),
('Home Decor'),
('Corporate Gifts');
Select * from categories;