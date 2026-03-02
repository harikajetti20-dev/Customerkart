CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    shop_name VARCHAR(100),
    owner_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password TEXT,
    address TEXT
);
Select * from sellers;
INSERT INTO sellers (shop_name, owner_name, email, phone, password, address)
VALUES ('Gift Galaxy', 'Kiran Kumar', 'kiran@giftgalaxy.com', '9876543210', 'kiran123', 'Hyderabad, Telangana'),
('Craft Corner', 'Meena Reddy', 'meena@craftcorner.com', '9123456789', 'meena123', 'Chennai, Tamil Nadu'), 
('Surprise Hub', 'Arjun Verma', 'arjun@surprisehub.com', '9988776655', 'arjun123', 'Bangalore, Karnataka'),
('Tech Trendz', 'Rahul Sharma', 'rahul@techtrendz.com', '9012345678', 'rahul123', 'Delhi, India'),
('Fashion Fiesta', 'Sneha Gupta', 'sneha@fashionfiesta.com', '9090909090', 'sneha123', 'Mumbai, Maharashtra'), 
('Beauty Basket', 'Anjali Singh', 'anjali@beautybasket.com', '8765432109', 'anjali123', 'Pune, Maharashtra'),
('Book World', 'Vikram Patel', 'vikram@bookworld.com', '9345678123', 'vikram123', 'Ahmedabad, Gujarat'),
('Home Needs', 'Priya Nair', 'priya@homeneeds.com', '7890123456', 'priya123', 'Kochi, Kerala'),
('Sports Hub', 'Rohit Das', 'rohit@sportshub.com', '8456123789', 'rohit123', 'Kolkata, West Bengal'), 
('Mobile Mart', 'Deepak Yadav', 'deepak@mobilemart.com', '9567812345', 'deepak123', 'Lucknow, Uttar Pradesh');