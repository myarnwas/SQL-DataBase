ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

CREATE TRIGGER update_stock_after_order
ON Order_Items
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.Stock = P.Stock - I.quantity
    FROM Products P
    INNER JOIN inserted I ON P.Prod_id = I.prod_id;
END;


-- Trigger ?????? ????????? ?? ???? ??????????
CREATE TRIGGER log_user_changes
ON USERS
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- ????? ???????
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO logs (user_id, action, action_date)
        SELECT user_id, 'INSERT', GETDATE()
        FROM inserted;
    END;

    -- ????? ???????
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO logs (user_id, action, action_date)
        SELECT user_id, 'UPDATE', GETDATE()
        FROM inserted;
    END;

    -- ????? ?????
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO logs (user_id, action, action_date)
        SELECT user_id, 'DELETE', GETDATE()
        FROM deleted;
    END;
END;

-- 4. ????? ??????
-- ???? ????? ?????? ????????? ?? ???? ????? ?????
CREATE FUNCTION calculate_revenue(@start_date DATE, @end_date DATE)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total_revenue DECIMAL(10,2);

    SELECT @total_revenue = SUM(P.Price * OI.quantity)
    FROM Orders O
    JOIN Order_Items OI ON O.order_id = OI.order_id
    JOIN Products P ON OI.prod_id = P.Prod_id
    WHERE O.order_date BETWEEN @start_date AND @end_date;

    RETURN ISNULL(@total_revenue, 0);
END;

-- ???? ?????? ?????? ?????? ?????
CREATE FUNCTION get_most_popular_product()
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @most_popular_product VARCHAR(100);

    SELECT TOP 1 @most_popular_product = P.Prod_name
    FROM Order_Items OI
    JOIN Products P ON OI.prod_id = P.Prod_id
    GROUP BY P.Prod_name
    ORDER BY SUM(OI.quantity) DESC;

    RETURN @most_popular_product;
END;

-- 5. ?????? ??????
-- ?????? ???? ???? ?????????
SELECT dbo.calculate_revenue('2024-01-01', '2024-12-31') AS Total_Revenue;

-- ?????? ???? ?????? ?????? ?????
SELECT dbo.get_most_popular_product() AS Most_Popular_Product;

-- 6. ????? ???? ???????? ?? ????? ????????
BACKUP DATABASE E_commerce1
TO DISK = 'C:\Backup\E_commerce1.bak'
WITH FORMAT, INIT;