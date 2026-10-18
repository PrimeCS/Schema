DROP DATABASE IF EXISTS grocery_db;
CREATE DATABASE grocery_db CHARACTER SET utf8mb4;
USE grocery_db;

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE grocery_items (
    item_id        INT AUTO_INCREMENT PRIMARY KEY,
    item_name      VARCHAR(100) NOT NULL,
    brand          VARCHAR(50)  NOT NULL,
    category_id    INT          NOT NULL,
    unit_size      VARCHAR(20)  NOT NULL,
    price          DECIMAL(8,2) NOT NULL,
    stock_quantity INT          NOT NULL DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO categories (category_name) VALUES
    ('Rice & Atta'),
    ('Pulses'),
    ('Spices'),
    ('Oils & Ghee'),
    ('Dairy'),
    ('Snacks'),
    ('Beverages');

INSERT INTO grocery_items (item_name, brand, category_id, unit_size, price, stock_quantity) VALUES
    ('Basmati Rice Classic', 'India Gate', 1, '5 kg', 650.00, 87),
    ('Whole Wheat Atta', 'Aashirvaad', 1, '5 kg', 290.00, 171),
    ('Unpolished Toor Dal', 'Tata Sampann', 2, '1 kg', 190.00, 59),
    ('Kabuli Chana', 'Rajdhani', 2, '500 g', 80.00, 66),
    ('Turmeric Powder', 'Everest', 3, '200 g', 70.00, 20),
    ('Garam Masala', 'Everest', 3, '100 g', 85.00, 36),
    ('Chicken Masala', 'Everest', 3, '100 g', 75.00, 62),
    ('Deggi Mirch', 'MDH', 3, '100 g', 80.00, 20),
    ('Chana Masala', 'MDH', 3, '100 g', 75.00, 152),
    ('Kachi Ghani Mustard Oil', 'Fortune', 4, '1 L', 150.00, 112),
    ('Pure Ghee', 'Amul', 4, '1 L', 650.00, 151),
    ('Taaza Toned Milk', 'Amul', 5, '1 L', 56.00, 151),
    ('Masti Dahi', 'Amul', 5, '400 g', 35.00, 21),
    ('Fresh Paneer', 'Amul', 5, '200 g', 90.00, 20),
    ('Gluco Biscuits', 'Parle-G', 6, '250 g', 25.00, 163),
    ('Good Day Butter Cookies', 'Britannia', 6, '200 g', 40.00, 141),
    ('Aloo Bhujia', 'Haldiram''s', 6, '200 g', 55.00, 154),
    ('Masala Munch', 'Kurkure', 6, '90 g', 20.00, 81),
    ('Gold Tea', 'Tata Tea', 7, '250 g', 150.00, 183),
    ('Mango Drink', 'Frooti', 7, '600 ml', 40.00, 191);