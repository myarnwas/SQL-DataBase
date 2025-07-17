
/*
3. SQL Functions:
   • Write a function to calculate the total revenue generated from all orders in a specific time period. Function Name: calculate_revenue(start_date DATE, end_date DATE)
 
   • Write a function to return the most popular product based on the number of times it has been ordered.
     • Function Name: get_most_popular_product()
*/
/*Function 1: calculate_revenue
--> Function: Calculate the total revenue from all orders within a specific time range
*/
CREATE OR ALTER FUNCTION calculate_revenue (
    @start_date DATE, /* --> Input: Start date of the time range */
    @end_date DATE /* --> Input: End date of the time range */
)
RETURNS DECIMAL(18, 2) /* --> Output: Total revenue as a decimal value */
AS
BEGIN
    DECLARE @total_revenue DECIMAL(18, 2); /* --> Variable to store the calculated revenue */

	/* --> Calculate the revenue by summing up the price * quantity for all orders in the date range*/
    SELECT @total_revenue = SUM(oi.quantity * p.price)
    FROM Order_Items oi
    INNER JOIN Orders o ON oi.order_id = o.order_id
    INNER JOIN Products p ON oi.product_id = p.product_id
    WHERE o.order_date BETWEEN @start_date AND @end_date;

	/* Return the total revenue */
    RETURN @total_revenue;
END;
GO

/*  • Write a function to return the most popular product based on the number of times it has been ordered.
     • Function Name: get_most_popular_product()
*/

/* --> Function: Return the most popular product based on the number of times it was ordered */
CREATE FUNCTION get_most_popular_product()
RETURNS INT /* --> Output: Product ID of the most popular product */
AS
BEGIN
  DECLARE @popular_product_id INT; /* --> Variable to store the product ID */

  /*  --> Find the product ID with the highest total quantity ordered */
  SELECT TOP 1 @popular_product_id = product_id
  FROM Order_Items
  GROUP BY product_id
  ORDER BY SUM(quantity) DESC;

  /* --> Return the product ID of the most popular product */
  RETURN @popular_product_id;
END;
