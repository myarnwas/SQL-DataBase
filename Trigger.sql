/*
1. Implementing Triggers:
   - Create a trigger that automatically updates the stock quantity in the Products table whenever a new order is placed.
     • Trigger Name: update_stock_after_order
     • Trigger Action: After an insert on the Order_Items table, reduce the stock quantity of the corresponding product based on the quantity ordered.
   - Create a trigger that logs any changes made to the Users table (insert, update, delete) into a separate log table.
     • Log Table Structure: 
       • log_id (int, primary key)
       • user_id (int)
       • action (varchar)
       • action_date (datetime)
*/
/*
1. Triggers
Trigger 1: update_stock_after_order */

/*--> Trigger: Automatically updates the stock quantity in the Products table after an order is placed */
CREATE TRIGGER update_stock_after_order
ON Order_Items
AFTER INSERT
AS
BEGIN
/*--> Decrease the stock quantity of the product based on the ordered quantity */
  UPDATE Products
  SET stock_quantity = stock_quantity - inserted.quantity
  /*--> Add a new column to the Products table for stock quantity with a default value of 0 */
  FROM Products
  INNER JOIN inserted ON Products.product_id = inserted.product_id;
END;
/* create column name --> stock_quantity in table Products*/
ALTER TABLE Products
ADD stock_quantity INT DEFAULT 0;

/*
Trigger 2: Log changes in Users table
*/
/*
INSERT Trigger
--> Trigger: Logs new user entries in the Users table into the User_Logs table
*/
CREATE TRIGGER log_user_insert
ON Users
AFTER INSERT
AS
BEGIN
/*--> Insert a log record for each new user with the action 'Insert'*/
  INSERT INTO User_Logs (user_id, [action], action_date)
  SELECT user_id, 'Insert', GETDATE()
  FROM inserted;
END;

/*
UPDATE Trigger
--> Trigger: Logs updates made to the Users table into the User_Logs table
*/
CREATE TRIGGER log_user_update
ON Users
AFTER UPDATE
AS
BEGIN
/* --> Insert a log record for each updated user with the action 'Update'*/
  INSERT INTO User_Logs (user_id, [action], action_date)/*[]*/
  SELECT user_id, 'Update', GETDATE()
  FROM inserted;
END;

/*DELETE Trigger
--> Trigger: Logs deletions from the Users table into the User_Logs table
*/
CREATE TRIGGER log_user_delete
ON Users
AFTER DELETE
AS
BEGIN
/*--> Insert a log record for each deleted user with the action 'Delete'*/
  INSERT INTO User_Logs (user_id, [action], action_date)
  SELECT user_id, 'Delete', GETDATE()
  FROM deleted;
END;
