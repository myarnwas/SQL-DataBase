use BikeStores;
/*select order_id,order_date,customer_id
from sales.orders
where customer_id in(select customer_id from sales.customers where city = 'New York')
order by order_date desc;
go
select product_name,list_price
from production.products
where list_price >= all(select avg(list_price) from production.products group by brand_id)
GO*/
select first_name,last_name,email,order_date
from sales.customers as c inner join sales.orders as o on c.customer_id=o.customer_id
go
select first_name,last_name,email,order_date
from sales.customers as c right join sales.orders as o on c.customer_id=o.customer_id
go 
select first_name,last_name,email,order_date
from sales.customers as c left join sales.orders as o on c.customer_id=o.customer_id
go
select first_name,last_name,email,order_date
from sales.customers as c full join sales.orders as o on c.customer_id=o.customer_id
go
select first_name,last_name,email,order_date
from sales.customers as c cross join sales.orders as o 


