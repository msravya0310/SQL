CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100)        
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer (CustomerID, CustomerName, Email, City, Country) VALUES
(1, 'John Smith', 'john.smith@gmail.com', 'New York', 'USA'),
(2, 'Priya Sharma', 'priya.sharma@gmail.com', 'Delhi', 'India'),
(3, 'Carlos Mendez', NULL, 'Madrid', 'Spain'),
(4, 'Aisha Khan', 'aisha.khan@gmail.com', NULL, 'UAE'),
(5, 'Liam Brown', 'liam.brown@gmail.com', 'London', NULL);



INSERT INTO Product (ProductID, ProductName, Category, Price, CustomerID) VALUES
(101, 'Laptop', 'Electronics', 850.00, 1),
(102, 'Smartphone', 'Electronics', 500.00, 1),
(103, 'Tablet', 'Electronics', 300.00, 2),
(104, 'Headphones', 'Accessories', 100.00, NULL),
(105, 'Watch', 'Accessories', 150.00, 3),
(106, 'Camera', 'Electronics', 700.00, 2),
(107, 'Shoes', 'Fashion', 80.00, 4),
(108, 'Backpack', 'Fashion',NULL,4);

--LEFT JOIN

SELECT 
     t1.CustomerID,
     t1.CustomerName,
     t2.ProductID,
     t2.ProductName
FROM CUSTOMER t1
LEFT JOIN
    Product t2
    ON 
      (t1.CustomerID = t2.CustomerID)
      order by t1.CustomerID

--RIGHT JOIN
SELECT  
     t1.CustomerID,
     t1.CustomerName,
     t2.ProductID,
     t2.ProductName
FROM Product t2
RIGHT JOIN
      Customer t1
      ON
      (t2.CustomerID = t1.CustomerID)
      order by t2.CustomerID

--LEFT OUTER JOIN
SELECT
     t1.CustomerID,
     t1.CustomerName,
     t2.ProductID,
     t2.ProductName
From Customer t1
LEFT OUTER JOIN
             Product t2
             ON
             (t1.CustomerID = t2.CustomerID)
             order by t1.CustomerID

--RIGHT OUTER JOIN
SELECT
     t1.CustomerID,
     t1.CustomerName,
     t2.ProductID,
     t2.ProductName
FROM  Product t2
RIGHT OUTER JOIN
    Customer t1
    ON
    (t2.CustomerID = t1.CustomerID)
    order by t2.CustomerID

--INNER JOIN
SELECT
     t1.CustomerID,
     t1.CustomerName,
     t2.ProductID,
     t2.ProductName
From Customer t1
INNER JOIN
            Product t2
            ON
            (t1.CustomerID = t2.CustomerID)
            order by t1.CustomerID

--FULL OUTER JOIN
SELECT
      t1.CustomerID,
      t1.CustomerName,
      t2.ProductID,
      t2.ProductName
FROM Product t2
FULL OUTER JOIN
           Customer t1
           ON
           (t2.CustomerID = t1.CustomerID)
            order by t2.CustomerID
----7. Symmetric Difference
SELECT 
    t1.CustomerID AS Customer_ID,
    t1.CustomerName,
    t1.Email,
    t1.City,
    t1.Country,
    t2.ProductID,
    t2.ProductName,
    t2.Category,
    t2.Price
FROM Customer t1
FULL OUTER JOIN Product t2
ON t1.CustomerID = t2.CustomerID
WHERE t1.CustomerID IS NULL OR t2.CustomerID IS NULL
ORDER BY t1.CustomerID;