-- Create products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
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