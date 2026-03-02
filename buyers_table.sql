
CREATE TABLE buyers (
    buyer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password TEXT,
    address TEXT
);


INSERT INTO buyers (name, email, phone, address) VALUES
('Ravi', 'ravi@gmail.com', '9870000001', 'Hyderabad'),
('Sita', 'sita@gmail.com', '9870000002', 'Chennai'),
('Aman', 'aman@gmail.com', '9870000003', 'Delhi'),
('Pooja', 'pooja@gmail.com', '9870000004', 'Mumbai'),
('Nikhil', 'nikhil@gmail.com', '9870000005', 'Bangalore'),
('Divya', 'divya@gmail.com', '9870000006', 'Pune'),
('Varun', 'varun@gmail.com', '9870000007', 'Kolkata');

UPDATE buyers SET city = 'Hyderabad' WHERE buyer_id = 10;
UPDATE buyers SET city = 'Chennai' WHERE buyer_id = 11;
UPDATE buyers SET city = 'Delhi' WHERE buyer_id = 12;
UPDATE buyers SET city = 'Mumbai' WHERE buyer_id = 13;
UPDATE buyers SET city = 'Bangalore' WHERE buyer_id = 14;
UPDATE buyers SET city = 'Pune' WHERE buyer_id = 15;
UPDATE buyers SET city = 'Kolkata' WHERE buyer_id = 16;

SELECT buyer_id, name, city FROM buyers ORDER BY buyer_id;

select * from buyers;