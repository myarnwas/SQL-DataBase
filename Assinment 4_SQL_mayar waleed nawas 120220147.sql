/*Lab 8
SQL – Data Manipulation
___________________________________________

Q1: Write SQL statements to perform the following queries on the Northwind database: */
GO
USE [Northwind]
GO
/*1. List product name, category name, and price of all products:*/

SELECT Products.ProductName, Categories.CategoryName, Products.UnitPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;

/*2. Include supplier name in the previous query:*/

SELECT Products.ProductName, Categories.CategoryName, Products.UnitPrice, Suppliers.CompanyName AS SupplierName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

/*3. Find the number of orders handled by each customer, including customer name:*/

SELECT Customers.CustomerID, Customers.ContactName, Customers.CompanyName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.ContactName, Customers.CompanyName
ORDER BY NumberOfOrders DESC;


/*4. Find the total amount of orders handled by each customer, showing customer name:*/

SELECT 
    Customers.CustomerID, 
    Customers.ContactName, 
    SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalOrderAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.CustomerID, Customers.ContactName
ORDER BY TotalOrderAmount DESC;


