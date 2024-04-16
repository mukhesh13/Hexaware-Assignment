--task 3
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


SELECT Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName;

SELECT DISTINCT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

SELECT ProductName, Description
FROM Products;

SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;

SELECT TOP 1 Orders.OrderID, Customers.FirstName, Customers.LastName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Orders.OrderID, Customers.FirstName, Customers.LastName
ORDER BY TotalRevenue DESC;

SELECT Products.ProductName, COUNT(OrderDetails.OrderDetailID) AS TimesOrdered
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName;

DECLARE @ProductName VARCHAR(100) = 'Smartphone';

SELECT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = @ProductName;

DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-12-31';

SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;
