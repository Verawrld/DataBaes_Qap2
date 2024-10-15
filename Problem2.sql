-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert products
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 999.99, 10),
('Smartphone', 499.99, 20),
('Tablet', 299.99, 15),
('Headphones', 79.99, 50),
('Smartwatch', 199.99, 30);

-- Insert customers
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');

-- Insert orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-10-01'),
(2, '2023-10-02'),
(3, '2023-10-03'),
(4, '2023-10-04'),
(1, '2023-10-05');

-- Insert order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), 
(1, 2, 2), 
(2, 3, 1), 
(2, 4, 1), 
(3, 5, 1), 
(3, 1, 1), 
(4, 2, 1), 
(4, 3, 1), 
(5, 4, 2), 
(5, 5, 1); 

-- Retrieve the names and stock quantities of all products
SELECT product_name, stock_quantity
FROM products;

-- Retrieve the product names and quantities for order with id 1
SELECT p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 1;

-- Retrieve all orders placed by customer with id 1 (including the ID’s of what was ordered and the quantities)
SELECT o.id AS order_id, oi.product_id, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
WHERE o.customer_id = 1;

-- Perform an update to simulate the reduction of stock quantities of items after a customer places an order
-- Simulating reduction for order with id 1
UPDATE products p
JOIN order_items oi ON p.id = oi.product_id
SET p.stock_quantity = p.stock_quantity - oi.quantity
WHERE oi.order_id = 1;

-- Remove order with id 1 and all associated order items from the system
DELETE FROM order_items
WHERE order_id = 1;

DELETE FROM orders
WHERE id = 1;