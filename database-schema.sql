-- Create a database named Bookstore
CREATE DATABASE Bookstore;



-- Create a table of the Publishers 

CREATE TABLE PUBLISHERS_18(
    publisher VARCHAR(255) PRIMARY KEY,
    address VARCHAR(255) DEFAULT 'UNKNOWN',
    phone VARCHAR(255) DEFAULT 'UNKNOWN',
    country VARCHAR(255) DEFAULT 'UNKNOWN'
);


  
-- Create a table of the Books
CREATE TABLE BOOKS_18 (
  isbn VARCHAR(10) PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  publication_year INT NOT NULL,
  price NUMERIC(10,2) DEFAULT 0.00,
  FOREIGN KEY (publisher) REFERENCES PUBLISHERS_18(publisher)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);



-- Create a table of the authors
CREATE TABLE AUTHORS_18 (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    gender VARCHAR(255) DEFAULT 'UNKNOWN',
    nationality VARCHAR(255) DEFAULT 'UKNOWN'

);


-- Create joint table for books and authors
CREATE TABLE BOOKS_AUTHORS_18 (
  isbn VARCHAR(10) REFERENCES BOOKS_18(isbn),
  id VARCHAR(20) REFERENCES AUTHORS_18(id),
  PRIMARY KEY (isbn, id)
);



-- Create a table of the reviews
CREATE TABLE REVIEWS_18(
    review_id VARCHAR(255) PRIMARY KEY,
    isbn VARCHAR(10),
    nickname VARCHAR(255) DEFAULT 'USER',
    ratings INT ,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    review TEXT DEFAULT 'not available',
    FOREIGN KEY (isbn) REFERENCES BOOKS_18(isbn)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

