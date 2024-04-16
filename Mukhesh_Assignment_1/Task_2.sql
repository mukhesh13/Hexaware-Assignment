
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh@example.com', '9876543210', 'Chennai, Tamil Nadu, India'),
(2, 'Sangeetha', 'Sundaram', 'sangeetha@example.com', '9876543211', 'Coimbatore, Tamil Nadu, India'),
(3, 'Ganesh', 'Venkataraman', 'ganesh@example.com', '9876543212', 'Madurai, Tamil Nadu, India'),
(4, 'Nithya', 'Manoharan', 'nithya@example.com', '9876543213', 'Tiruchirappalli, Tamil Nadu, India'),
(5, 'Karthik', 'Srinivasan', 'karthik@example.com', '9876543214', 'Salem, Tamil Nadu, India'),
(6, 'Deepa', 'Krishnan', 'deepa@example.com', '9876543215', 'Tirunelveli, Tamil Nadu, India'),
(7, 'Vishnu', 'Iyer', 'vishnu@example.com', '9876543216', 'Vellore, Tamil Nadu, India'),
(8, 'Priya', 'Rajagopal', 'priya@example.com', '9876543217', 'Erode, Tamil Nadu, India'),
(9, 'Suresh', 'Ranganathan', 'suresh@example.com', '9876543218', 'Thanjavur, Tamil Nadu, India'),
(10, 'Shalini', 'Ramakrishnan', 'shalini@example.com', '9876543219', 'Kanyakumari, Tamil Nadu, India');

SELECT * FROM Customers;

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', 'High-performance laptop', 1000.00),
(2, 'Smartphone', 'Latest smartphone model', 800.00),
(3, 'Headphones', 'Premium headphones', 150.00),
(4, 'Camera', 'Professional camera', 1200.00),
(5, 'Tablet', 'Tablet device', 500.00),
(6, 'Smartwatch', 'Fitness tracking smartwatch', 200.00),
(7, 'Speaker', 'Wireless speaker system', 250.00),
(8, 'Television', 'Smart LED TV', 1200.00),
(9, 'Gaming Console', 'Next-gen gaming console', 400.00),
(10, 'Printer', 'All-in-one printer', 300.00);
SELECT * FROM Products;


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-04-01', 1200.00),
(2, 2, '2024-04-02', 900.00),
(3, 3, '2024-04-03', 1100.00),
(4, 4, '2024-04-04', 1300.00),
(5, 5, '2024-04-05', 1000.00),
(6, 6, '2024-04-06', 800.00),
(7, 7, '2024-04-07', 700.00),
(8, 8, '2024-04-08', 600.00),
(9, 9, '2024-04-09', 1400.00),
(10, 10, '2024-04-10', 950.00);

SELECT * FROM Orders;


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 1),
(6, 6, 6, 2),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 2),
(10, 10, 10, 1);

SELECT * FROM OrderDetails;


INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 10, '2024-04-01 09:00:00'),
(2, 2, 20, '2024-04-02 10:00:00'),
(3, 3, 15, '2024-04-03 11:00:00'),
(4, 4, 5, '2024-04-04 12:00:00'),
(5, 5, 25, '2024-04-05 13:00:00'),
(6, 6, 30, '2024-04-06 14:00:00'),
(7, 7, 12, '2024-04-07 15:00:00'),
(8, 8, 8, '2024-04-08 16:00:00'),
(9, 9, 18, '2024-04-09 17:00:00'),
(10, 10, 22, '2024-04-10 18:00:00');

SELECT * FROM Inventory;


-- Task 2
--1
SELECT FirstName, LastName, Email
FROM Customers;

--2
SELECT Orders.OrderID, Orders.OrderDate, CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName
FROM Orders, Customers
WHERE Orders.CustomerID = Customers.CustomerID;

--3
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (1, 'Ajith', 'Kumar', 'ajith.kumar@example.com', '9876543210', 'Chennai, Tamil Nadu, India');

--4
UPDATE Products
SET Price = ROUND(Price * 1.1, 2)
WHERE Description LIKE '%electronic%';
SELECT*FROM Products

--5
DECLARE @OrderIDToDelete INT = 1;
BEGIN TRANSACTION;
DELETE FROM OrderDetails
WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders
WHERE OrderID = @OrderIDToDelete;
COMMIT TRANSACTION;

SELECT * FROM Orders
SELECT * FROM OrderDetails

--6
INSERT INTO Orders VALUES (9,7,'2023-04-24',80000)
SELECT * FROM Orders

--7
DECLARE @CustomerIDToUpdate INT = 3;
DECLARE @NewEmail VARCHAR(100) = 'new_email@example.com';
DECLARE @NewAddress VARCHAR(255) = '123 New Street, New City, New Country';

UPDATE Customers
SET Email = @NewEmail,
    Address = @NewAddress
WHERE CustomerID = @CustomerIDToUpdate;
SELECT * FROM Customers;

--8
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Quantity * Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
)
WHERE EXISTS (
    SELECT 1
    FROM OrderDetails
    WHERE OrderDetails.OrderID = Orders.OrderID
);
SELECT*FROM Orders

--9
DECLARE @CustomerIDToDelete INT = 4;
BEGIN TRANSACTION;
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = @CustomerIDToDelete
);
DELETE FROM Orders
WHERE CustomerID = @CustomerIDToDelete;

--10
INSERT INTO Products (ProductID,ProductName, Description, Price)
VALUES ( '11','new', 'Description of the new gadget', 499.99);
SELECT*FROM Products

--11
DECLARE @OrderIDToUpdate INT = 101;
DECLARE @NewStatus VARCHAR(50) = 'Shipped';

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderIDToUpdate;

--12
ALTER TABLE Customers
ADD NumberOfOrders INT; 

UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

SELECT*FROM Customers
