
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
(
    'Alice',
    'Smith',
    'alice.smith@example.com',
    '111-222-3333'
),
(
    'Bob',
    'Johnson',
    'bob.johnson@example.com',
    '444-555-6666'
);

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Books'),
('Home Goods');

INSERT INTO products (product_name, description, price, stock_quantity, category_id) VALUES
(
    'Smartphone',
    'Latest model smartphone',
    799.99,
    50,
    (SELECT category_id FROM categories WHERE category_name = 'Electronics')
),
(
    'The Great Adventure',
    'A thrilling novel',
    15.50,
    200,
    (SELECT category_id FROM categories WHERE category_name = 'Books')
);

INSERT INTO orders (customer_id, total_amount) VALUES
(
    (SELECT customer_id FROM customers WHERE email = 'alice.smith@example.com'),
    815.49
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(
    (SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE email = 'alice.smith@example.com')),
    (SELECT product_id FROM products WHERE product_name = 'Smartphone'),
    1,
    799.99
),
(
    (SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE email = 'alice.smith@example.com')),
    (SELECT product_id FROM products WHERE product_name = 'The Great Adventure'),
    1,
    15.50
);


