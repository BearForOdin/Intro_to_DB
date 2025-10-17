-- Create the database
CREATE DATABASE alx_book_store;
GO

-- Use the database
USE alx_book_store;
GO

-- 1. Authors Table
CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);
GO

-- 2. Books Table
CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NULL,
    price DECIMAL(10,2) NOT NULL,
    publication_date DATE NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
GO

-- 3. Customers Table
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address NVARCHAR(MAX) NULL
);
GO

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- 5. Order_Details Table
CREATE TABLE Order_Details (
    orderdetail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO
