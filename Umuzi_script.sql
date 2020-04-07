CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR,
    Address VARCHAR(200),
    Phone INT,
    Email VARCHAR(100),
    City VARCHAR(20),
    Country VARCHAR(50)
);

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JobTitle VARCHAR(20)
);

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    ProductID INT, 
    PaymentID INT,
    FulfilledByEmployeeID INT,
    DateRequired DATE,
    DateShipped DATE,
    Status VARCHAR(20)
);

CREATE TABLE Payments(
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL
);

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(300),
    BuyPrice DECIMAL
);
INSERT INTO Customers VALUES (1, 'John', 'Hilbert', 'Male', '284 chaucer st', 084789651, 'john@gmail.com','Johannesburg', 'South Africa');
INSERT INTO Customers VALUES (2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa' );
INSERT INTO Customers VALUES (3, 'Leon', 'Glen', 'Male', '81 Everton Rd, Gillits', 082083830, 'Leon@gmail.com', 'Durban', 'South Africa');
INSERT INTO Customers VALUES (4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', 0485687255, 'Charl.muller@yahoo.com', 'Berlin', 'Germany');
INSERT INTO Customers VALUES (5, 'Julia', 'Stein', 'Female', '2 Wernerring', 0486724450, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

INSERT INTO Employees VALUES (1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');
INSERT INTO Employees VALUES (2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');
INSERT INTO Employees VALUES (3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

INSERT INTO Products VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75), 
(2, 'Classic Car', 'Turnable front wheels, steering function', 550.75),
(3, 'Sports car', 'Turnable front wheels, steering function', 700.60);

ALTER TABLE Payments ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

INSERT INTO Payments VALUES (1, 1, '01-09-2018', 150.75), (2,5, '03-09-2018', 150.75), (3, 4, '03-09-2018', 700.60);

ALTER TABLE Orders ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
ALTER TABLE Orders ADD FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);
ALTER TABLE Orders ADD FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees(EmployeeID);

INSERT INTO Orders (OrderID, ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, Status) VALUES (1, 1, 1, 2, '05-09-2018', 'Not shipped');
INSERT INTO Orders VALUES (2, 1, 2, 2, '04-09-2018', '03-09-2018', 'Shipped'); 
INSERT INTO Orders (OrderID, ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, Status) VALUES (3, 3, 3, 3, '   06-09-2018', 'Not shipped');

SELECT * FROM Customers;
SELECT FirstName FROM Customers;
SELECT FirstName FROM Customers WHERE CustomerID =1;
UPDATE Customers SET FirstName = 'Lerato' WHERE CustomerID = 1;
UPDATE Customers SET LastName = 'Mabitso' WHERE CustomerID = 1;
DELETE FROM Customers WHERE CustomerID = 2;
SELECT COUNT (DISTINCT Status) FROM Orders;
SELECT MAX(Amount) FROM Payments;
SELECT * FROM Customers ORDER BY Country;
SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 600;
SELECT * FROM Customers WHERE Country = 'Germany' AND City ='Berlin';
SELECT * FROM Customers WHERE City = 'Cape Town' OR City = 'Durban';
SELECT * FROM Products WHERE BuyPrice > 500;
SELECT SUM(Amount) FROM Payments;
SELECT COUNT(Status) FROM Orders WHERE Status = 'Shipped';
SELECT AVG(BuyPrice) FROM Products;
SELECT * FROM Payments INNER JOIN Customers ON Customers.CustomerID = Payments.PaymentID;
SELECT * FROM Products WHERE Description = 'Turnable front wheels, steering function';


