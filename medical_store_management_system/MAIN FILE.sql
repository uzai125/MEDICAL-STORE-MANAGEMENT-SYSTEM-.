Create Database Medical_Store_Management_System;
use Medical_Store_Management_System;
CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100),
    manufacturer VARCHAR(100),
    expiry_date DATE,
    unit_price DECIMAL(10, 2),
    quantity_in_stock INT
);
INSERT INTO Medicines (medicine_name, manufacturer, expiry_date, unit_price, quantity_in_stock) VALUES 
('Aspirin', 'Bayer', '2024-06-30', 50.00, 20),
('pandol', 'Bayer', '2026-04-25', 50.00, 20),
('Ibuprofen', 'Pfizer', '2024-05-25', 80.00, 15),
('Amoxicillin', 'GSK', '2025-03-31', 120.00, 8),
('Paracetamol', 'Johnson & Johnson', '2025-12-31', 70.00, 25);
select * from medicines;


CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email, address) VALUES 
(1, 'XYZ Pharmaceuticals', 'subhan', '03134543675', 'subhan034@gmail.com', '456 Oak Avenue, Town, Country'),
(2, 'MediCorp', 'haris', '0332432543', 'haris567@gmail.com', '789 Elm Street, City, Country'),
(3, 'HealthCare Suppliers', 'haseeb', '03342353257', 'haseeb353@gmail.com', '321 Maple Road, Town, Country'),
(4, 'Pharma Solutions Ltd', 'hamza', '03443322110', 'hamza532@gmail.com', '987 Pine Lane, City, Country'),
(5, 'Global Generics', 'haseeb', '03777888999', 'haseeb334@gmail.com', '654 Cedar Avenue, Town, Country');
select * from Suppliers; 


CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
INSERT INTO Customers (customer_name, phone_number, email, address) VALUES 
('Shabu Baloch', '03101314631', 'shabubaloch30@gmail.com', '123 Main Street, BALOCHISTAN, Pakistan'),
('Ayesha Khan', '03232678901', 'ayeshakhan300@gmail.com', '456 Oak Avenue, LAHORE, Pakistan'),
('Uzair', '03352752985', 'syedabduluzair60@gmail.com', '789 Elm Street, KARACHI, Pakistan'),
('Kamran Alam', '0342928152', 'kamranalam39@gmail.com', '987 Pine Lane, KPK, Pakistan'),
('Sara Khan', '03356789001', 'SaraKhan123@gmail.com', '654 Cedar Avenue, KARACHI, Pakistan');
select * from Customers;

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
); 
INSERT INTO Sales (customer_id, sale_date, total_amount) VALUES 
(1, '2024-05-26 10:00:00', 120.00),
(2, '2024-05-27 11:00:00', 150.00),
(3, '2024-05-28 12:00:00', 180.00),
(4, '2024-05-23 13:00:00', 200.00),
(5, '2024-05-26 14:00:00', 220.00);
select * from sales;

CREATE TABLE Sale_Items (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    medicine_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Sale_Items (sale_id, medicine_id, quantity_sold, unit_price) VALUES 
(1, 1, 2, 25.00),
(1, 2, 1, 40.00),
(2, 3, 3, 30.00),
(2, 4, 2, 50.00),
(3, 5, 4, 35.00);
select * from Sale_Items;

CREATE TABLE Purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
INSERT INTO Purchase (supplier_id, purchase_date, total_amount) VALUES 
(1, '2024-05-26', 500.00),
(2, '2024-05-26', 600.00),
(3, '2024-05-26', 700.00),
(4, '2024-05-26', 800.00),
(5, '2024-05-26', 900.00);
select * from Purchase;


CREATE TABLE Purchase_Items (
    purchase_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    medicine_id INT,
    quantity_purchased INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Purchase_Items (purchase_id, medicine_id, quantity_purchased, unit_price) VALUES 
(1, 1, 10, 20.00),
(2, 2, 5, 30.00),
(3, 3, 8, 25.00),
(4, 4, 3, 35.00),
(5, 5, 12, 15.00);
select * from Purchase_Items;
CREATE TABLE Stock_Adjustment (
    adjustment_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    adjustment_date DATETIME,
    adjustment_type ENUM('Addition', 'Subtraction'),
    quantity_adjusted INT,
    reason VARCHAR(200),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Stock_Adjustment (medicine_id, adjustment_date, adjustment_type, quantity_adjusted, reason) VALUES 
(1, '2024-05-26 10:00:00', 'Addition', 20, 'Received new shipment'),
(2, '2024-05-27 09:00:00', 'Subtraction', 5, 'Damaged during handling'),
(3, '2024-05-28 11:30:00', 'Addition', 10, 'Correcting inventory count');
select * from Stock_Adjustment;

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO Categories (category_name) VALUES 
('Pain Relief'),
('Antibiotics'),
('Digestive Health'),
('Cardiovascular'),
('Respiratory');
select * from Categories;

CREATE TABLE Medicine_Categories (
    medicine_category_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    category_id INT,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
select * from Medicine_Categories;
INSERT INTO Medicine_Categories (medicine_id, category_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


UPDATE Customers SET customer_name = 'ali'WHERE customer_id = 2;
UPDATE Customers SET email = 'IMRANKHAN60gmail.com' WHERE customer_id = 1;
UPDATE Customers SET email = 'ali24@gmail.com' WHERE customer_id IN (2, 3, 4);
DELETE FROM Medicines WHERE medicine_id = 1;
select * from Medicine_Categories;
SELECT * FROM Sales WHERE customer_id IN (1, 3, 5);
SELECT * FROM Sales WHERE customer_id = 1;
(SELECT customer_name AS name FROM Customers) UNION (SELECT supplier_name AS name FROM Suppliers);
SELECT * FROM Customers WHERE phone_number LIKE '033%';
SELECT * FROM Customers WHERE customer_name LIKE '%r';
SELECT * FROM Customers WHERE customer_name LIKE 'u%';
SELECT * FROM Medicines WHERE medicine_name LIKE 'A%';
SELECT DISTINCT address FROM Customers WHERE address LIKE '%KARACHI%';
SELECT * FROM Medicines ORDER BY expiry_date;
SELECT * FROM Medicines WHERE quantity_in_stock = 15; 
SELECT * FROM Medicines WHERE expiry_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 2 MONTH);
SELECT * FROM Customers WHERE phone_number = '03352752985';
SELECT * FROM Sales ORDER BY sale_date DESC;
SELECT * FROM Medicines WHERE expiry_date IS NULL;
SELECT * FROM Sales WHERE total_amount BETWEEN 100 AND 180;
SELECT * FROM Sales WHERE DATE(sale_date) = '2024-05-27';
SELECT * FROM Sales WHERE sale_date BETWEEN '2024-05-23' AND '2024-05-27';
SELECT * FROM Sales WHERE sale_date >= '2024-05-27';
SELECT customer_id, COUNT(sale_id) AS num_purchases FROM Sales GROUP BY customer_id HAVING num_purchases > 2;
SELECT medicine_name, SUM(quantity_in_stock) AS total_quantity FROM Medicines GROUP BY medicine_name;
SELECT SUM(total_amount) AS total_sales_amount FROM Sales;
SELECT AVG(unit_price) AS average_unit_price FROM Medicines;
SELECT MAX(unit_price) AS max_unit_price FROM Medicines;
SELECT Min(unit_price) AS max_unit_price FROM Medicines;
SELECT COUNT(DISTINCT manufacturer) AS distinct_manufacturers_count FROM Medicines;
SELECT COUNT(*) AS customer_count FROM Customers;
SELECT DISTINCT manufacturer FROM Medicines;
SELECT DISTINCT email FROM Customers ORDER BY email;
SELECT customer_name, SUBSTRING_INDEX(customer_name, ' ', 1) AS first_name FROM Customers;
SELECT customer_id, SUM(total_amount) AS total_sales_amount FROM Sales GROUP BY customer_id;
SELECT Sales.sale_id, Sales.sale_date, Sales.total_amount, Customers.customer_name, Customers.phone_number FROM Sales JOIN Customers ON Sales.customer_id = Customers.customer_id;
SELECT * FROM Sales INNER JOIN Customers ON Sales.customer_id = Customers.customer_id;
SELECT * FROM Sales LEFT JOIN Customers ON Sales.customer_id = Customers.customer_id;
SELECT * FROM Sales RIGHT JOIN Customers ON Sales.customer_id = Customers.customer_id;
SELECT medicine_name, unit_price FROM Medicines WHERE unit_price < (SELECT AVG(unit_price) FROM Medicines);
SELECT m.medicine_name, pi.quantity_purchased FROM Medicines m JOIN Purchase_Items pi ON m.medicine_id = pi.medicine_id JOIN Purchase p ON pi.purchase_id = p.purchase_id WHERE p.purchase_date = (SELECT MAX(purchase_date) FROM Purchase);
SELECT c.customer_name, SUM(s.total_amount) AS total_spent FROM Customers c JOIN Sales s ON c.customer_id = s.customer_id WHERE YEAR(s.sale_date) = 2024 GROUP BY c.customer_name;
SELECT c.customer_name, COUNT(s.sale_id) AS num_sales FROM Customers c LEFT JOIN Sales s ON c.customer_id = s.customer_id GROUP BY c.customer_name;
SELECT purchase_id, SUM(unit_price * quantity_purchased) AS total_amount FROM Purchase_Items GROUP BY purchase_id;
SELECT c.customer_name FROM Customers c LEFT JOIN Sales s ON c.customer_id = s.customer_id WHERE s.sale_date IS NULL OR s.sale_date > '2024-01-01';
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sale_month, SUM(total_amount) AS total_sales_amount FROM Sales GROUP BY sale_month;
SELECT s.sale_id,c.customer_name,m.medicine_name,si.quantity_sold,si.unit_price,(si.quantity_sold * si.unit_price) AS total_amount
FROM Sales s JOIN Customers c ON s.customer_id = c.customer_id JOIN Sale_Items si ON s.sale_id = si.sale_id JOIN Medicines m ON si.medicine_id = m.medicine_id;
SELECT c.customer_name FROM Customers c JOIN Sales s ON c.customer_id = s.customer_id  WHERE s.sale_date = (SELECT MAX(sale_date) FROM Sales);
SELECT Customers.customer_name, Sales.sale_date, Medicines.medicine_name
FROM Customers JOIN Sales ON Customers.customer_id = Sales.customer_id JOIN Sale_Items ON Sales.sale_id = Sale_Items.sale_id JOIN Medicines ON Sale_Items.medicine_id = Medicines.medicine_id;
SELECT * FROM Customers NATURAL JOIN Sales;
SELECT c1.customer_name, c2.customer_name, c1.address FROM Customers c1 JOIN Customers c2 ON c1.address = c2.address AND c1.customer_id <> c2.customer_id;

