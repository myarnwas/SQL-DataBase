/*Answer Question 4:  Sorts the customers by their first names in ascending order. */
select * from sales.customers 
where [state] = 'CA'
order by first_name ASC /* The Default Order Is: Ascending --> ASC , Not Important To uuse It */