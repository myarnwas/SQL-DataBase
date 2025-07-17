/* To Ensure We Use BikeStore DataBase We write this line */
use BikeStores;
/*NOTE ---> SQL Not Casesensetive  ================================================================== */
/*Answer Question 1:  Finds the first name and last name of all customers. */
select first_name, last_name 
from sales.customers 
GO /* =============================================================================================== */
/*Answer Question 2:  Get data from all table columns. */
select * 
from sales.customers 
GO /* =============================================================================================== */
/*Answer Question 3:  Returns the customers located in California. */
select * 
from sales.customers 
where [state] = 'CA' /*when we use keyword and its reserved keyword we should use [] To egnore it*/
GO /* =============================================================================================== */
/*Answer Question 4:  Sorts the customers by their first names in ascending order. */
select * 
from sales.customers 
where [state] = 'CA'
order by first_name ASC /* The Default Order Is: Ascending --> ASC, Not Important To Use It.  */
GO /* =============================================================================================== */
/*Answer Question 5:  Returns all the cities of customers located in California and the
number of customers in each city. */
select city ,count(*) AS [number of customers]
from sales.customers 
where [state] = 'CA'
group by city
GO /* =============================================================================================== */
/*Answer Question 6:  Returns the city in California which has more than ten customers. */
select city ,count(*) AS [number of customers]
from sales.customers 
where [state] = 'CA'
group by city having count(*) > 10
order by city /*NOT EMPORTANT*/
GO /* =============================================================================================== */
