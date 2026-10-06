CREATE DATABASE online_book_store;

USE online_book_store;

-- =========================================
-- USERS TABLE
-- =========================================

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- BOOKS TABLE
-- =========================================

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- ORDERS TABLE
-- =========================================

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    customer_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    address TEXT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
);


-- =========================================
-- ORDER ITEMS TABLE
-- =========================================

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT,
    book_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,

    FOREIGN KEY (order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,

    FOREIGN KEY (book_id)
        REFERENCES books(id)
        ON DELETE SET NULL
);


-- =========================================
-- SAMPLE BOOKS
-- =========================================

INSERT INTO books (title, author, price, image)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 299.00, 'images/gatsby.jpg'),
('Harry Potter', 'J.K. Rowling', 499.00, 'images/harry-potter.jpg'),
('Atomic Habits', 'James Clear', 399.00, 'images/atomic-habits.jpg'),
('The Alchemist', 'Paulo Coelho', 349.00, 'images/alchemist.jpg'),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 299.00, 'images/rich-dad.jpg');