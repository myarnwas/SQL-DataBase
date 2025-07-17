/*Q1: SQL Queries for the pubs database*/

/*1. List the first and last names of all authors whose first names contain the alphabet ‘t’:*/
Go
USE [Pubs]
GO
SELECT au_fname, au_lname 
FROM authors 
WHERE au_fname LIKE '%t%';

/*2. List in alphabetical order, the first names of all authors who live in ‘Berkeley’ city:*/
Go
USE [Pubs]
GO
SELECT au_fname 
FROM authors 
WHERE city = 'Berkeley' 
ORDER BY au_fname ASC;

/*3. What are the total numbers of books?*/
Go
USE [Pubs]
GO
SELECT COUNT(*) AS TotalBooks 
FROM titles;

/*4. How many authors live in each city? The result should state the city and the number of authors in that city:*/
Go
USE [Pubs]
GO
SELECT city, COUNT(*) AS NumberOfAuthors 
FROM authors 
GROUP BY city 
ORDER BY NumberOfAuthors DESC;

/*Q2: SQL Queries for the Northwind database*/

/*1. Find the highest and lowest product price and the difference between them:*/
GO
USE [Northwind]
GO
SELECT 
    MAX(UnitPrice) AS HighestPrice, 
    MIN(UnitPrice) AS LowestPrice, 
    (MAX(UnitPrice) - MIN(UnitPrice)) AS PriceDifference 
FROM Products;

/*2. What are the total numbers of employees located in the USA?*/
GO
USE [Northwind]
GO
SELECT COUNT(*) AS TotalEmployeesInUSA 
FROM Employees 
WHERE Country = 'USA';

/*3. List the total numbers of orders for each customer:*/
GO
USE [Northwind]
GO
SELECT CustomerID, COUNT(*) AS TotalOrders 
FROM Orders 
GROUP BY CustomerID 
ORDER BY TotalOrders DESC;

/*4. List all the customers’ total number for each job in each country:*/
GO
USE [Northwind]
GO
SELECT C.Country, E.Title, COUNT(*) AS Total_number_for_Customers
FROM Customers AS C
JOIN Employees AS E ON C.ContactTitle = E.Title
GROUP BY C.Country, E.Title
ORDER BY C.Country, Total_number_for_Customers DESC;

/*5. List all the countries that have at least five customers:*/
GO
USE [Northwind]
GO
SELECT Country 
FROM Customers 
GROUP BY Country 
HAVING COUNT(*) >= 5 
ORDER BY Country;


