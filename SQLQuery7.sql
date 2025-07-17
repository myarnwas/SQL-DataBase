/*Answer Question 6:  Returns the city in California which has more than ten customers. */
select city ,count(*)
from sales.customers 
where [state] = 'CA'
group by city having count(*) > 10
order by city /*NOT EMPORTANT*/