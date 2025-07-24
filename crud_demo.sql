USE bookbazaar;

-- CREATE

START TRANSACTION;

INSERT INTO books (title, author_id, genre, edition, description, language, publication_date, price, stock_quantity) 
VALUES ('The Great Gatsby', 2, 'Classic Literature', 'Scribner Edition', 'American classic about the Jazz Age', 'English', '1925-04-10', 12.99, 15);

COMMIT;

-- READ 

START TRANSACTION;

-- Assuming the book with ID 7 since we added 6 in schema.sql
SELECT * FROM books WHERE book_id = 7;
SELECT book_id, title, genre, price, stock_quantity FROM books;

COMMIT;

-- UPDATE

START TRANSACTION;

UPDATE books 
SET price = 15.99, 
    stock_quantity = 20,
    description = 'Updated: American classic novel about the Jazz Age and the American Dream'
WHERE book_id = 7;
SELECT * FROM books WHERE book_id = 7;

COMMIT;

-- DELETE OPERATION

START TRANSACTION;

DELETE FROM books WHERE book_id = 7;

COMMIT;