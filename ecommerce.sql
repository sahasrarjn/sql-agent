CREATE TABLE Users (

    UserID INT PRIMARY KEY,

    UserName VARCHAR(100) NOT NULL,

    UserEmail VARCHAR(100) UNIQUE NOT NULL,

    RegistrationDate DATE NOT NULL

);



CREATE TABLE Roles (

    RoleID INT PRIMARY KEY,

    RoleName VARCHAR(50) NOT NULL

);



CREATE TABLE UserRoles (

    UserID INT,

    RoleID INT,

    PRIMARY KEY (UserID, RoleID),

    FOREIGN KEY (UserID) REFERENCES Users(UserID),

    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)

);



CREATE TABLE Products (

    ProductID INT PRIMARY KEY,

    ProductName VARCHAR(100) NOT NULL,

    ProductDescription TEXT,

    Price DECIMAL(10, 2) NOT NULL,

    Stock INT NOT NULL,

    CategoryID INT

);



CREATE TABLE Orders (

    OrderID INT PRIMARY KEY,

    UserID INT,

    OrderDate DATE NOT NULL,

    TotalAmount DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)

);



CREATE TABLE OrderDetails (

    OrderDetailID INT PRIMARY KEY,

    OrderID INT,

    ProductID INT,

    Quantity INT NOT NULL,

    Price DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)

);



CREATE TABLE Categories (

    CategoryID INT PRIMARY KEY,

    CategoryName VARCHAR(100) NOT NULL
    


);



CREATE TABLE RandomTable (

    a INT PRIMARY KEY,      -- This could be ProductID (reference)

    b INT,                  -- This could be Category ID (Value)

    c DATE,                 -- This could be Date added or modified

    d INT,                  -- This could be Stock Quantity or some flag

    FOREIGN KEY (a) REFERENCES Products(ProductID),

    FOREIGN KEY (b) REFERENCES Categories(CategoryID)

);



-- Populating basic values

INSERT INTO Users 
    (UserID, UserName, UserEmail, RegistrationDate) 
VALUES 
    (1, 'John Doe', 'john@example.com', '2020-01-01'),
    (2, 'Jane Doe', 'jane@example.com', '2020-02-01'),
    (3, 'Bob Smith', 'bob@example.com', '2020-03-01'),
    (4, 'Alice Johnson', 'alice@example.com', '2020-04-01'),
    (5, 'Charlie Brown', 'charlie@example.com', '2020-05-01'),
    (6, 'David Williams', 'david@example.com', '2020-06-01'),
    (7, 'Emma Davis', 'emma@example.com', '2020-07-01'),
    (8, 'Michael Miller', 'michael@example.com', '2020-08-01'),
    (9, 'Emily Wilson', 'emily@example.com', '2020-09-01'),
    (10, 'Daniel Moore', 'daniel@example.com', '2020-10-01');


INSERT INTO Roles 
    (RoleID, RoleName) 
VALUES 
    (1, 'Admin'), 
    (2, 'Customer'),


INSERT INTO UserRoles 
    (UserID, RoleID) 
VALUES 
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2);


INSERT INTO Categories 
    (CategoryID, CategoryName) 
VALUES 
    (1, 'Electronics'), 
    (2, 'Books'),
    (3, 'Clothing'),
    (4, 'Home & Kitchen'),
    (5, 'Sports & Outdoors'),
    (6, 'Health & Personal Care'),
    (7, 'Toys & Games'),
    (8, 'Automotive'),
    (9, 'Grocery & Gourmet Food'),
    (10, 'Office Products');


INSERT INTO Products 
    (ProductID, ProductName, ProductDescription, Price, Stock, CategoryID) 
VALUES 
    (1, 'Laptop', 'High performance laptop', 999.99, 10, 1), 
    (2, 'Book', 'Interesting book to read', 19.99, 50, 2),
    (3, 'Smartphone', 'Latest model smartphone', 799.99, 20, 1),
    (5, 'Sofa', 'Comfortable 3-seater sofa', 499.99, 15, 4),
    (6, 'Basketball', 'Official size and weight', 29.99, 25, 5),
    (7, 'Monitor', '4K Resolution Monitor', 299.99, 15, 1),
    (8, 'Keyboard', 'Mechanical Keyboard', 49.99, 25, 1),
    (9, 'Mouse', 'Wireless Mouse', 29.99, 40, 1),
    (11, 'Webcam', 'HD Webcam', 69.99, 20, 1),
    (13, 'Router', 'Wi-Fi Router', 79.99, 15, 1),
    (15, 'SSD', 'Solid State Drive', 99.99, 20, 1),
    (16, 'RAM', '16GB DDR4 RAM', 79.99, 25, 1),
    (18, 'GPU', 'High performance GPU', 599.99, 5, 1),
    (19, 'Power Supply', 'Modular Power Supply', 99.99, 15, 1),
    (20, 'Motherboard', 'High performance Motherboard', 199.99, 10, 1),
    (21, 'Cooling Fan', 'RGB Cooling Fan', 29.99, 30, 1),
    (22, 'Laptop Bag', 'Waterproof Laptop Bag', 39.99, 40, 1),
    (23, 'Running Shoes', 'Comfortable and durable', 59.99, 30, 5),
    (24, 'T-Shirt', '100% Cotton', 19.99, 60, 3),
    (25, 'Jeans', 'Skinny Jeans', 49.99, 25, 3),
    (26, 'Cooking Pan', 'Non-stick Pan', 29.99, 20, 4),
    (27, 'Toy Car', 'Remote Control Car', 24.99, 35, 7),
    (28, 'Novel', 'Best Selling Novel', 14.99, 40, 2),
    (29, 'Office Chair', 'Ergonomic Office Chair', 89.99, 15, 4),
    (30, 'Protein Powder', 'Whey Protein', 39.99, 20, 6);
    

INSERT INTO Orders 
    (OrderID, UserID, OrderDate, TotalAmount) 
VALUES 
    (1, 1, '2021-10-10', 1019.98),
    (2, 2, '2021-10-11', 59.99),
    (3, 3, '2021-10-12', 499.99),
    (4, 4, '2021-10-13', 299.99),
    (5, 5, '2021-10-14', 79.99);


INSERT INTO OrderDetails 
    (OrderDetailID, OrderID, ProductID, Quantity, Price) 
VALUES 
    (1, 1, 1, 1, 999.99), 
    (2, 1, 2, 1, 19.99),
    (3, 2, 3, 1, 799.99),
    (4, 3, 5, 1, 499.99),
    (5, 4, 7, 1, 299.99),
    (6, 5, 13, 1, 79.99);


INSERT INTO RandomTable 
    (a, b, c, d) 
VALUES 
    (1, 1, '2021-01-01', 10), 
    (2, 2, '2021-01-01', 50),
    (3, 1, '2021-02-01', 20),
    (5, 4, '2021-03-01', 15),
    (6, 5, '2021-04-01', 25),
    (7, 1, '2021-05-01', 15),
    (8, 1, '2021-06-01', 25),
    (9, 1, '2021-07-01', 40),
    (11, 1, '2021-08-01', 20),
    (13, 1, '2021-09-01', 15),
    (15, 1, '2021-10-01', 20),
    (16, 1, '2021-11-01', 25),
    (18, 1, '2021-12-01', 5),
    (19, 1, '2022-01-01', 15),
    (20, 1, '2022-02-01', 10),
    (21, 1, '2022-03-01', 30),
    (22, 1, '2022-04-01', 40),
    (23, 5, '2022-05-01', 30),
    (24, 3, '2022-06-01', 60),
    (25, 3, '2022-07-01', 25),
    (26, 4, '2022-08-01', 20),
    (27, 7, '2022-09-01', 35),
    (28, 2, '2022-10-01', 40),
    (29, 4, '2022-11-01', 15),
    (30, 6, '2022-12-01', 20);

