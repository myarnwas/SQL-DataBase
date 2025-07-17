
/*2. Database Administration
   - Write SQL scripts to perform the following administrative tasks:
    - Create a user with specific privileges to access the e-commerce database.
    - Grant and revoke permissions for users on the Orders and Products tables.
     - Create a backup of the e-commerce database.
*/
/*Create a user with specific privileges*/
/* Create a new SQL Server login with a specified password*/
CREATE LOGIN ecommerce_user WITH PASSWORD = 'password123';

/* Create a user for the e-commerce database --> Associate the login */
USE E_Commerce_DB;
CREATE USER ecommerce_user FOR LOGIN ecommerce_user;

/* Grant privileges 
--> to the user on Orders and Products tables
*/
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO ecommerce_user;
GRANT SELECT, UPDATE ON Products TO ecommerce_user;


/*  Revoke update permissions on Products */
REVOKE UPDATE ON Products FROM ecommerce_user;

/*Backup the e-commerce database
Run this command from SQL Server Management Studio (SSMS) or equivalent:*/

/*--> Create a backup of the e-commerce database and save it to the specified path */

BACKUP DATABASE E_Commerce_DB 
TO DISK = 'E:\DataBase\hw\NOT-LAB\HW4+5\Backups\E_Commerce_DB.bak';
