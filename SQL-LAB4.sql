create table Employee(
emp_id int primary key,
fname varchar(7) not null,
lname varchar(7) not null,
birth_date date ,
sex char(1),
salary float check(salary<2500000),
phone varchar unique,
email varchar(5) unique
);
GO
create schema schema10;
GO
create table mayarTest.schema10.Orders(
order_id int primary key,
order_time time not null,
order_status varchar(15) not null,
order_date date ,
order_type varchar(15),
salary float check(salary<2500000),
emp_id int references Employee(emp_id),
);
