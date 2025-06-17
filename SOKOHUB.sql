USE SokoHub;

CREATE DATABASE SokoHub;
CREATE TABLE RetailTb(
OrderID	INT,
CustomerName VARCHAR(100),
ProductCategory VARCHAR(100),
OrderAmount	DECIMAL,
OrderDate DATE,
PaymentMethod VARCHAR(100)
);
INSERT INTO RetailTb (OrderID, CustomerName, ProductCategory, OrderAmount, OrderDate, PaymentMethod)
VALUES
(1, 'Brenda Njeri', 'Electronics', 7500.00, '2025-06-01', 'Mpesa'),
(2, 'John Kimani', 'Home', 2450.00, '2025-06-02', 'Card'),
(3, 'Irene Gathoni', 'Beauty', 1300.00, '2025-06-03', 'Mpesa'),
(4, 'Derrick Otieno', 'Electronics', 9200.00, '2025-06-03', 'Cash'),
(5, 'Alice Wambui', 'Home', 5600.00, '2025-06-04', 'Card'),
(6, 'Fiona Atieno', 'Beauty', 950.00, '2025-06-04', 'Mpesa'),
(7, 'Kevin Kipkoech', 'Electronics', 12000.00, '2025-06-05', 'Card'),
(8, 'Sarah Nyambura', 'Home', 1500.00, '2025-06-06', 'Mpesa'),
(9, 'Brian Mutiso', 'Beauty', 4000.00, '2025-06-07', 'Cash'),
(10, 'Mercy Chebet', 'Electronics', 8700.00, '2025-06-07', 'Mpesa'),
(11, 'Steve Ochieng', 'Home', 3300.00, '2025-06-08', 'Card'),
(12, 'Vanessa Naliaka', 'Beauty', 1600.00, '2025-06-08', 'Mpesa'),
(13, 'Peter Wachira', 'Electronics', 10000.00, '2025-06-09', 'Cash'),
(14, 'Linda Auma', 'Beauty', 750.00, '2025-06-09', 'Mpesa'),
(15, 'Frankline Gikonyo', 'Home', 4100.00, '2025-06-10', 'Card');


--BUSINESS QUESTIONS--

--1. Which orders were paid using 'Mpesa'?
SELECT *
FROM RetailTb
WHERE PaymentMethod='Mpesa';  

--2List all orders where the product category is either 'Electronics' or 'Home'.

SELECT *
FROM RetailTb
WHERE ProductCategory IN ('Electronics', 'Home');  

--3. Find all orders where the amount is between 1,000 and 5,000 shillings.
SELECT *
FROM RetailTb
WHERE OrderAmount BETWEEN 1000.00 AND 5000.00;

--4. How many orders have been made per product category?
SELECT  ProductCategory ,COUNT(*)  AS TotalOrders
FROM RetailTb
GROUP BY ProductCategory;

--5.What is the total order amount per payment method?
Select PaymentMethod, SUM(OrderAmount) AS TotalRevenue
FROM RetailTb
GROUP BY PaymentMethod;

--6. Which product categories have made more than Ksh 20,000 in total sales?
SELECT ProductCategory,SUM(OrderAmount) AS TotalSales
FROM RetailTb
GROUP BY ProductCategory
HAVING SUM (OrderAmount) >= 20000.00;

--7How many different customers ordered each product category?
SELECT  ProductCategory,COUNT(DISTINCT  CustomerName) AS Customers
FROM RetailTb
GROUP BY ProductCategory;

--8. Find the day(s) when more than 3 orders were made.
SELECT OrderDate ,COUNT(*) AS OrdersCount
FROM RetailTb
GROUP BY OrderDate
HAVING COUNT(*) >=2;

--9. Which is the most preferred payment method?
SELECT PaymentMethod, COUNT(*) AS UsageCount
FROM RetailTb
GROUP BY PaymentMethod
ORDER BY UsageCount DESC;
