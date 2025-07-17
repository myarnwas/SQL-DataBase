use Northwind;
/*Q1: Northwind Database*/
/*1.Insert a new record Into the Employees table:*/
set IDENTITY_INSERT Employees on;
INSERT INTO dbo.Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, [Address], City,
Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
VALUES (7370, 'DANIAL', 'ALBERT', 'SALESMAN', 'Teacher', '1991-02-01', '2012-03-15', 'Palestine-Gaza' , 'Nusierat', 'Muslim', 'P213',
'Camp_1',2557013,'stud', CAST('<Binary data>' AS varbinary(MAX)), 'Nothing' ,2, 'http://accweb/emmployees/davolio.bmp');
set IDENTITY_INSERT Employees off;


/*2.Promote ‘Callahan’ (EmployeeID=8) to Sales Manager:*/

UPDATE Employees
SET Title = 'Sales Manager'
WHERE EmployeeID = 8;

/*3.Increase all product prices for Supplier ‘Tokyo Traders’ (Id=4) by 5%:*/

UPDATE Products
SET UnitPrice = UnitPrice * 1.05
WHERE SupplierID = 4;

/*4.Delete the new employee record added in question 1:*/

DELETE FROM Employees
WHERE EmployeeID = 7370;

/*5.Delete all customers with no orders:*/

DELETE FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);
/*=======================================================================================================================================*/
use Pubs ;
/*Q2: Pubs Database*/
/*1.Insert a new record Into the Titles table:*/

INSERT INTO Titles (title_id, title, [type], pub_id, price, notes,  pubdate)
VALUES ('T9999', 'new Book Title', 'business', 123, 19.99, 5000,  2025);

/*2.Decrease 3% for all business titles (Books):*/

UPDATE Titles
SET Price = Price * 0.97
WHERE Type = 'business';

/*3.Delete all publishers from France:*/

DELETE FROM Publishers
WHERE Country = 'France';
