CREATE TABLE Lineage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `from` VARCHAR(100),
    `to` VARCHAR(100)
);

INSERT INTO Lineage (`from`, `to`) VALUES
('Users.UserID', 'Orders.UserID'),
('Products.ProductID', 'OrderDetails.ProductID'),
('Orders.OrderID', 'OrderDetails.OrderID'),
('Products.ProductID', 'RandomTable.a'),
('Categories.CategoryID', 'RandomTable.b');
