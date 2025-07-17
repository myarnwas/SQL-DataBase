CREATE DATABASE E_commerce1;
USE E_commerce1;

--انشاء جدول المستخدمين 
CREATE TABLE USERS(
 user_id INT IDENTITY(1,1) PRIMARY KEY,
 user_name VARCHAR(50) NOT NULL,
 password VARCHAR(100)NOT NULL,
 email VARCHAR(100)NOT NULL

);

-- انشاء جدول التصنيف  
CREATE TABLE Categories(
category_id INT IDENTITY(1,1) PRIMARY KEY,
category_name VARCHAR(50)NOT NULL

);

--انشاء جدول المنتجات 
CREATE TABLE Products(
 Prod_id INT IDENTITY(1,1) PRIMARY KEY,
 Prod_name VARCHAR(100) NOT NULL,
 Price DECIMAL(10,2)NOT NULL,
 category_id INT,
 FOREIGN KEY(category_id) REFERENCES Categories(category_id)
);

-- انشاء جدول الطلب 
CREATE TABLE Orders(
order_id INT IDENTITY(1,1) PRIMARY KEY,
order_date DATE NOT NULL,
user_id INT,
FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

-- انشاء جدول تفاصيل الطلب
CREATE TABLE Order_Items(
Order_Item_id INT IDENTITY(1,1) PRIMARY KEY,
order_id INT,
prod_id INT,
quantity INT NOT NULL,
FOREIGN KEY(Prod_id) REFERENCES Products(Prod_id),
FOREIGN KEY(order_id) REFERENCES Orders(order_id)
);

--ادخال عشر بيانات لجدول المستخدمين
INSERT INTO USERS(user_name, password,email)
VALUES('Ahmed jomaa',123456,'ahmad@gmail.com'),
('Nora KHaled',654321,'nora@gmail.com'),
('Rawan ali',635241,'rawan@gmail.com'),
('Ebrahim joha',362514,'ebrahim@gmail.com'),
('Bashar moshtaha',142536,'bashar@gmail.com'),
('Mohammed mosa',415263,'mohammed@gmail.com'),
('Asmaa omar',61532,'asmaa@gmail.com'),
('Marwa ahmed',625143,'marwa@gmail.com'),
('Anwar shawa',326541,'anwar@gmail.com'),
('Aya ahmad',241536,'aya@gmail.com');

--اضافة بيانات الى جدول التصنيفات
INSERT INTO Categories(category_name)
VALUES('Book'),('cloths'),('electronic'),
('jewelry'),('video games'),('cosmetics'),
('sport'),('food'),('school suppliers'),('watches');

--اضافة بيانات الى جدول المنتجات 
INSERT INTO Products(Prod_name,Price,category_id)
VALUES('Atomic Habits',15.00,1),
('Harry potter',12.00,1),
('Learn web development',20.00,1),
('Casual dress',30.00,2),
('Wireless Earbuds',50.00,3),
('Smartphone',300.00,3),
('Radio',250.00, 3),
('TV ',50.00, 3),
('jacket',70.00,2),
('The legand of zelda',60.00,5),
('Foundation',15.00,6),
('Matte lipstick',20.00,6),
('Dumbbell set',50.00,7),
('Yoga mat',25.00,7),
('fast food',70.00,8),
('peans',20.00,8),
('vegetable',40.00,8),
('fruit',10.00,8),
('Dtes',50.00,8),
('Womans classic strap watch',120.00,10);
DELETE FROM  Orders;
--اضافة بيانات لجدول الطلب
INSERT INTO Orders(order_date ,user_id )
VALUES('2024-12-5',1),
('2024-12-9',1),
('2024-12-7',1),
('2024-9-2',1),
('2024-12-1',5),
('2024-10-4',6),
('2024-4-30',3),
('2024-3-12',9),
('2024-11-7',8),
('2024-7-30',2);

--اضافة بيانات لجدول تفاصيل الطلب 
INSERT INTO Order_Items(order_id,prod_id,quantity)
VALUES (1,2,5),
(1,3,20),(2,1,9),(2,5,1),(3,4,17),
(3,6,12),(4,2,8),(5,7,49),(5,8,7),(3,5,18);

-- الاستعلام الاول 

SELECT 
    O.order_id, 
    O.order_date, 
    U.user_id, 
    U.user_name, 
    U.email
FROM 
    Orders O
JOIN 
    USERS U ON U.user_id = O.user_id;


-- الاستعلام الثاني
SELECT 
    C.category_name, 
    COUNT(P.Prod_id) AS product_count
FROM 
    Categories C
LEFT JOIN 
    Products P ON C.category_id = P.category_id
GROUP BY 
    C.category_name;
	--الاستعلام الثالث 

	SELECT 
    U.user_id, 
    U.user_name, 
    COUNT(O.order_id) AS order_count
FROM 
    USERS U
JOIN 
    Orders O ON U.user_id = O.user_id
GROUP BY 
    U.user_id, U.user_name
HAVING 
    COUNT(O.order_id) > 3;


	-- الاستعلام الرابع 
	SELECT 
    P.Prod_id, 
    P.Prod_name, 
    P.Price
FROM 
    Products P
LEFT JOIN 
    Order_Items OI ON P.Prod_id = OI.prod_id
WHERE 
    OI.prod_id IS NULL;

	SELECT 
    U.user_id, 
    U.user_name, 
    O.order_id, 
    O.order_date
FROM 
    USERS U
LEFT JOIN 
    Orders O ON U.user_id = O.user_id
ORDER BY 
    U.user_id;


CREATE PROCEDURE Insert_Product
    @Prod_name VARCHAR(100),
    @Price DECIMAL(10,2),
    @category_id INT
AS
BEGIN
    INSERT INTO Products (Prod_name, Price, category_id)
    VALUES (@Prod_name, @Price, @category_id);
    PRINT 'Product added successfully!';
END;

EXEC Insert_Product 
    @Prod_name = 'Wireless Mouse', 
    @Price = 25.00, 
    @category_id = 3;
	SELECT * FROM Products;

CREATE TABLE logs(
log_id INT PRIMARY KEY IDENTITY(1,1),
user_id INT ,
action VARCHAR (50),
action_date DATETIME);


