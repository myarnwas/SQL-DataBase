/*
 1- Create a relational database for  e-commerce platform with the following tables:
- Users: (user_id, username, password, email)
- Products: (product_id, product_name, price, category_id)
- Categories: (category_id, category_name)
- Orders: (order_id, user_id, order_date)
- Order_Items: (order_item_id, order_id, product_id, quantity)
- Populate each table with sample data (at least 10 entries per table)
*/


/* Create Database*/
CREATE DATABASE E_Commerce_DB;

/* Use the created database*/
USE E_Commerce_DB;


/* Create Users Table*/
CREATE TABLE Users (
    user_id INT PRIMARY KEY identity,
    username VARCHAR(100) NOT NULL,
    [password] VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

/* Create Categories Table*/
CREATE TABLE Categories (
    category_id INT PRIMARY KEY identity,
    category_name VARCHAR(100) NOT NULL
);

/* Create Products Table*/
CREATE TABLE Products (
    product_id INT PRIMARY KEY identity,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

/* Create Orders Table*/
CREATE TABLE Orders (
    order_id INT PRIMARY KEY identity,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

/* Create Order_Items Table*/
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY identity,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



/*=====================  Populate each table with sample data  ========================*/


/* Insert Data Into Users*/
INSERT INTO Users (username, [password], email) VALUES
('user1', 'password1', 'user1@email.com'),
('user2', 'password2', 'user2@email.com'),
('user3', 'password3', 'user3@email.com'),
('user4', 'password4', 'user4@email.com'),
('user5', 'password5', 'user5@email.com'),
('user6', 'password6', 'user6@email.com'),
('user7', 'password7', 'user7@email.com'),
('user8', 'password8', 'user8@email.com'),
('user9', 'password9', 'user9@email.com'),
('user10', 'password10', 'user10@email.com');

/* Insert Data Into Categories*/
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Toys'),
('Beauty'),
('Sports'),
('Automotive'),
('Groceries'),
('Health');

/* Insert Data Into Products*/
INSERT INTO Products (product_name, price, category_id) VALUES
('Laptop', 799.99, 1),
('T-shirt', 19.99, 2),
('Fiction Book', 9.99, 3),
('Blender', 49.99, 4),
('Toy Car', 12.99, 5),
('Shampoo', 5.99, 6),
('Soccer Ball', 15.99, 7),
('Car Tires', 99.99, 8),
('Apple', 1.99, 9),
('Vitamin C', 12.99, 10);

/* Insert Data Into Orders*/
INSERT INTO Orders (user_id, order_date) VALUES
(1, '2024-12-01'),
(2, '2024-12-02'),
(3, '2024-12-03'),
(1, '2024-12-04'),
(4, '2024-12-05'),
(5, '2024-12-06'),
(2, '2024-12-07'),
(6, '2024-12-08'),
(7, '2024-12-09'),
(8, '2024-12-10');

/* Insert Data Into Order Items*/
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 1),
(4, 5, 2),
(5, 6, 1),
(6, 7, 3),
(7, 8, 1),
(8, 9, 4),
(9, 10, 2);

/* 
Another Insert Data For Tables 
we add this line(SET IDENTITY_INSERT Users On;) becuase when i create table i put in PK column constraint named identity
And You Should Write this line After previse line (SET IDENTITY_INSERT Users OFF;)
Note : we can write this sentence to another table ---> just replace table name that you need .
*/
SET IDENTITY_INSERT Users ON;
INSERT INTO Users (user_id, username, [password], email)
VALUES 
(11, 'Alice', 'password123', 'alice@example.com'),
(12, 'Bob', 'password456', 'bob@example.com'),
(13, 'Charlie', 'password789', 'charlie@example.com');
SET IDENTITY_INSERT Users OFF;
SET IDENTITY_INSERT Categories ON;
INSERT INTO Categories (category_id, category_name)
VALUES 
(11, 'Electronics'),
(12, 'Clothing'),
(13, 'Books');
SET IDENTITY_INSERT Categories OFF;
SET IDENTITY_INSERT Products ON;
INSERT INTO Products (product_id, product_name, price, category_id)
VALUES 
(11, 'Laptop', 1200, 11),
(12, 'Smartphone', 800, 11),
(13, 'T-shirt', 20, 12),
(14, 'Jeans', 40, 12),
(15, 'Novel', 15, 13),
(16, 'Textbook', 50, 13),
(17, 'Headphones', 100, 11),
(18, 'Tablet', 500, 11),
(19, 'Sneakers', 60, 12),
(110, 'Jacket', 80, 12);
SET IDENTITY_INSERT Products OFF;
SET IDENTITY_INSERT Orders ON;
INSERT INTO Orders (order_id, user_id, order_date)
VALUES 
(11, 11, '2024-11-15'),
(12, 12, '2024-11-16'),
(13, 12, '2024-11-17');
SET IDENTITY_INSERT Orders OFF;
SET IDENTITY_INSERT Order_Items ON;
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity)
VALUES 
(11, 11, 11, 11),   /* Alice ordered Laptop */
(12, 11, 13, 12),   /* Alice ordered T-shirt (2)*/
(13, 12, 12, 11),   /* Bob ordered Smartphone*/
(14, 12, 14, 11);   /* Bob ordered Jeans*/
SET IDENTITY_INSERT Order_Items OFF;
/*
this insert to show output in Question query 3, when i dont write this there is NO output see
we add this line(SET IDENTITY_INSERT Users On;) becuase when i create table i put in PK column constraint named identity
And You Should Write this line After previse line (SET IDENTITY_INSERT Users OFF;)
Note : we can write this sentence to another table ---> just replace table name that you need .
*/
SET IDENTITY_INSERT Users On;
INSERT INTO Users (user_id, username, [password], email)
VALUES 
(20, 'JohnDoe', 'pass123', 'john@example.com'),
(21, 'JaneSmith', 'pass456', 'jane@example.com'),
(22, 'AliceBrown', 'pass789', 'alice@example.com'),
(23, 'BobWhite', 'pass101', 'bob@example.com');
SET IDENTITY_INSERT Users OFF;

SET IDENTITY_INSERT Orders On;

INSERT INTO Orders (order_id, user_id, order_date)
VALUES 
(20, 20, '2024-12-01'),
(21, 20, '2024-12-02'),
(22, 20, '2024-12-03'),
(23, 20, '2024-12-04'),
(24, 21, '2024-12-05'),
(25, 21, '2024-12-06'),
(26, 22, '2024-12-07'),
(27, 22, '2024-12-08');
SET IDENTITY_INSERT Orders OFF;


/*================================================================================================*/
/*
2- Write  SQL queries that utilize different retrieval techniques :
- List all orders along with user details.
- Count the number of products in each category.
- Find users who have placed more than three orders.(Using subquery)
- Find products that have never been ordered.
- List all users and their corresponding orders (if any).
*/


/* Q1 : List all orders along with user details*/
SELECT o.order_id, u.username, u.email, o.order_date
FROM Orders o
JOIN Users u ON o.user_id = u.user_id;

/* Q2 : Count the number of products in each category*/
SELECT c.category_name, COUNT(p.product_id) AS number_of_products
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;


/* Q3 : Find users who have placed more than three orders.(Using subquery) */
SELECT username
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    GROUP BY user_id
    HAVING COUNT(order_id) > 3
);

/* Q4 : Find products that have never been ordered*/
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

/* Q5 : List all users and their corresponding orders (if any)*/
SELECT u.username, o.order_id, o.order_date
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id;

/*================================================================================================*/
/*
 3- Create two stored procedures:
- One to insert a new product into the Products table.
- Another to retrieve all orders for a specific user based on user_id.
*/

/* Part 1 ------> Stored Procedure to Insert New Product */
CREATE PROCEDURE InsertNewProduct (
 @product_name VARCHAR(100),
 @price DECIMAL(10, 2),
 @category_id INT
)
AS
BEGIN
 /* Insert new product into the Products table */
 INSERT INTO Products (product_name, price, category_id)
 VALUES (@product_name, @price, @category_id);
 /* Select the newly inserted product_id (assuming it's the latest inserted) */
 SELECT product_id
 FROM Products
 WHERE product_name = @product_name
 AND price = @price
 AND category_id = @category_id;
END;
GO
/* Execute the procedure */
EXEC InsertNewProduct @product_name = 'Smart Watch', @price = 199.99, @category_id = 1;
GO
/* Part 2 ------> Stored Procedure to retrieve all orders for a specific user based on user_id */
CREATE PROCEDURE GetUserOrders (
 @user_id INT
)
AS
BEGIN
 /* Declare variable for order count */
 DECLARE @order_count INT;
 -- Retrieve all orders for the user
 SELECT o.order_id, o.order_date, u.username
 FROM Orders o
 JOIN Users u ON o.user_id = u.user_id
 WHERE o.user_id = @user_id;
 /* Calculate the total number of orders for the user */
 SELECT @order_count = COUNT(*)
 FROM Orders
 WHERE user_id = @user_id;
 /* Return the total order count for the user */
 SELECT @order_count AS total_orders;
END;
GO
/* Execute the procedure */
EXEC GetUserOrders @user_id = 1;
GO


/*================================================================================================*/
/*
4- Write two SQL functions:
- One function to calculate the total price of an order based on order_id.
- Another function to return the number of products in a specific category
*/

/* Part 1 ------> Function to Calculate the Total Price of an Order */
CREATE FUNCTION CalculateOrderTotal (@p_order_id INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
 DECLARE @total_price DECIMAL(10, 2);
 /* Calculate total price based on order items and product prices */
 SELECT @total_price = SUM(p.price * oi.quantity)
 FROM Order_Items oi
 JOIN Products p ON oi.product_id = p.product_id
 WHERE oi.order_id = @p_order_id;
 /* Return the total price */
 RETURN @total_price;
END;
GO
/* Execute the function */
SELECT dbo.CalculateOrderTotal(1) AS Total_Price_of_an_Order;
GO
/* Part 2 ------> Function to Return the Number of Products in a Specific Category */
CREATE FUNCTION GetProductCountByCategory (@p_category_id INT)
RETURNS INT
AS
BEGIN
 DECLARE @product_count INT;
 /* Count the number of products in the specified category */
 SELECT @product_count = COUNT(*)
 FROM Products
 WHERE category_id = @p_category_id;
 /* Return the count */
 RETURN @product_count;
END;
GO
/* Execute the function */
SELECT dbo.GetProductCountByCategory(2) AS the_Number_of_Products;
GO

