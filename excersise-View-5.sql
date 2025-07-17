CREATE VIEW staff_salesthose AS
SELECT 
    staffs.staff_id,
    YEAR(orders.order_date) AS year,
    MONTH(orders.order_date) AS month,
    DAY(orders.order_date) AS day,
    SUM(order_items.quantity) AS total_quantity
FROM 
    sales.order_items
JOIN 
    sales.staffs ON staffs.staff_id = staffs.staff_id
JOIN 
    sales.orders ON order_items.order_id = orders.order_id
GROUP BY 
    staffs.staff_id, 
    YEAR(orders.order_date), 
    MONTH(orders.order_date), 
    DAY(orders.order_date);
	go
select * from staff_salesthose