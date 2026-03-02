CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES sellers(seller_id),
    category_id INT REFERENCES categories(category_id),
    name VARCHAR(150),
    description TEXT,
    price NUMERIC(10,2),
    stock INT,
    image_url TEXT   
);
INSERT INTO products (seller_id, category_id, name, description, price, stock, image_url) VALUES
(1, 1, 'Birthday Surprise Box', 'Customized birthday gift box with chocolates and photo frame', 799.00, 25, 'https://picsum.photos/200?random=1'),
(2, 2, 'Anniversary Photo Frame', 'Romantic LED photo frame for couples', 599.00, 30, 'https://picsum.photos/200?random=2'),
(3, 3, 'Wedding Gift Hamper', 'Premium wedding hamper with decor items', 1499.00, 15, 'https://picsum.photos/200?random=3'),
(4, 4, 'Valentine Teddy Bear', 'Soft red teddy with heart design', 499.00, 40, 'https://picsum.photos/200?random=4'),
(5, 5, 'Personalized Mug', 'Custom printed coffee mug with name', 299.00, 50, 'https://picsum.photos/200?random=5'),
(6, 6, 'Wooden Photo Frame', 'Classic wooden frame for memories', 399.00, 35, 'https://picsum.photos/200?random=6'),
(7, 7, 'Handmade Greeting Card', 'Beautiful handmade greeting card', 199.00, 60, 'https://picsum.photos/200?random=7'),
(8, 8, 'Kids Toy Gift Set', 'Colorful toy combo for kids', 699.00, 20, 'https://picsum.photos/200?random=8'),
(9, 9, 'Home Decor Wall Art', 'Modern wall art for living room decor', 899.00, 18, 'https://picsum.photos/200?random=9'),
(10, 10, 'Corporate Gift Diary', 'Premium diary with pen gift set', 549.00, 22, 'https://picsum.photos/200?random=10');
Select * from products;