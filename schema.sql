CREATE DATABASE IF NOT EXISTS bookbazaar

USE bookbazaar;

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100),
    bio TEXT,
    UNIQUE KEY unique_author_name (first_name, last_name)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    address TEXT
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(100),
    edition VARCHAR(50),
    description TEXT,
    language VARCHAR(50),
    publication_date DATE,
    price DECIMAL(10,2),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE user_books (
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    date_added DATE NOT NULL,
    PRIMARY KEY (user_id, book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- Inserts are AI generated because I couldn't think of them on my own - Ziyad

INSERT INTO authors (first_name, last_name, nationality, bio) VALUES
('George', 'Orwell', 'British', 'English novelist and essayist, known for works like 1984 and Animal Farm'),
('Jane', 'Austen', 'British', 'English novelist known for romantic fiction set among the landed gentry'),
('Harper', 'Lee', 'American', 'American novelist best known for To Kill a Mockingbird'),
('J.K.', 'Rowling', 'British', 'British author best known for the Harry Potter fantasy series');

INSERT INTO users (username, email, password_hash, phone_number, address) VALUES
('johndoe', 'john@example.com', 'hashed_password_123', '+1-555-0101', '123 Main St, New York, NY 10001'),
('janereader', 'jane@example.com', 'hashed_password_456', '+1-555-0102', '456 Oak Ave, Los Angeles, CA 90210'),
('bookworm87', 'alex@example.com', 'hashed_password_789', '+1-555-0103', '789 Pine Rd, Chicago, IL 60601');

INSERT INTO books (title, author_id, genre, edition, description, language, publication_date, price, stock_quantity) VALUES
('1984', 1, 'Dystopian Fiction', 'Penguin Classics', 'A dystopian social science fiction novel about totalitarian control', 'English', '1949-06-08', 15.99, 10),
('Animal Farm', 1, 'Political Satire', 'Signet Classics', 'An allegorical novella reflecting events leading up to the Russian Revolution', 'English', '1945-08-17', 12.99, 8),
('Pride and Prejudice', 2, 'Romance', 'Oxford World Classics', 'A romantic novel following Elizabeth Bennet and Mr. Darcy', 'English', '1813-01-28', 14.99, 12),
('Sense and Sensibility', 2, 'Romance', 'Penguin Classics', 'A novel about the Dashwood sisters and their romantic entanglements', 'English', '1811-10-30', 13.99, 5),
('To Kill a Mockingbird', 3, 'Southern Gothic', 'Harper Perennial', 'A novel about racial injustice in the American South', 'English', '1960-07-11', 16.99, 15),
('Harry Potter and the Philosopher''s Stone', 4, 'Fantasy', 'Bloomsbury', 'The first novel in the Harry Potter series about a young wizard', 'English', '1997-06-26', 18.99, 20);

INSERT INTO user_books (user_id, book_id, date_added) VALUES
(1, 1, '2025-01-15'),
(1, 3, '2025-01-20'),
(2, 2, '2025-01-18'),
(2, 4, '2025-01-22'),
(3, 1, '2025-01-10'),
(3, 6, '2025-01-25');