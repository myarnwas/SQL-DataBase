/*insert into orders
output inserted.salary
values
 (10, '20:00:00', 'kbk', '2024-12-05', 'dfd', 555555),
    (101, '15:30:00', 'abc', '2024-11-30', 'ghi', 444444),
    (102, '18:45:00', 'xyz', '2024-12-01', 'lmn', 333333),
    (103, '09:15:00', 'pqr', '2024-12-02', 'stu', 222222);
*/

update orders set salary=00005500 , order_type='doctor' where order_id=101
select order_status+'-->'+ order_type as'bunctuation' from orders

select * from orders where order_type like 'd%'

select max(salary) as maxsalary from orders
