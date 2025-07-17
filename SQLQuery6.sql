/*Answer Question 5:  Returns all the cities of customers located in California and the
number of customers in each city. */
select city ,count(*) as [number of customers]
from sales.customers 
where [state] = 'CA'
group by city