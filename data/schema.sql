-- Run once to setup MySQL
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'myPassword'; // real password removed for GitHub submission
flush privileges;

CREATE DATABASE nanas_greens;
-- run show databases to verify nanas_greens was created
SHOW DATABASES;
-- run use <database_name> to switch to database
USE nanas_greens;

-- DROP TABLE IF EXISTS customers;
-- DROP TABLE IF EXISTS orders;
-- DESCRIBE customers;

CREATE TABLE customers
(
customer_Id int AUTO_INCREMENT PRIMARY KEY,
customer_name varchar(50) NOT NULL, 
phone varchar(50),
email varchar(50) NOT NULL UNIQUE,
address1 varchar(50),
city varchar(50),
state varchar(50),
zipCode varchar(15)
);

-- SELECT * FROM customers;

INSERT INTO customers (customer_Id, customer_name, phone, email, address1, city, state, zipCode)
VALUES (NULL,'Stephanie Czetli','302-555-1212','stephanie@gmail.com','123 Main St.','Middletown','DE',19709),
(NULL,'Robert Czetli','302-555-1213','rob@gmail.com','123 Main St.','Middletown','DE',19709),
(NULL,'Paige Czetli','302-555-1214','paige@gmail.com','123 Main St.','Middletown','DE',19709),
(NULL,'Bob Space','484-555-2212','bob@gmail.com','123 South St.','Wilmington','DE',19320),
(NULL,'Meridith Space','484-555-2312','meridith@gmail.com','123 South St.','Wilmington','DE',19320),
(NULL,'Aubrey Space','484-634-2412','aubrey@gmail.com','123 South St.','Wilmington','DE',19320),
(NULL,'Joey Steffy','484-412-1232','joey@gmail.com','123 Oregon Pk.','Newark','DE',19335),
(NULL,'Jasmine Wilson','302-555-1242','jasmine@gmail.com','123 President Ave.','Middletown','DE',19709),
(NULL,'Erika Howell','814-623-1212','erika@gmail.com','123 Fruitville Pk.','Georgetown','DE',19709),
(NULL,'Nancy Tyler','717-295-1782','nancy@gmail.com','123 Roosevelt Blvd.','Lewes','DE',17601);
;

CREATE TABLE orders
(
order_Id int AUTO_INCREMENT PRIMARY KEY,
customer_Id int,
FOREIGN KEY (customer_Id) REFERENCES customers (customer_Id),
order_date date NOT NULL,
order_status varchar(30),
delivery_date date NOT NULL
);

INSERT INTO orders (order_Id, customer_Id, order_date, order_status, delivery_date)
VALUES (NULL,NULL,'2020-02-14','Delivered','2020-02-14'),
(NULL,NULL,'2020-02-14','Delivered','2020-02-14'),
(NULL,NULL,'2020-02-14','Delivered','2020-02-14'),
(NULL,NULL,'2020-02-15','Delivered','2020-02-15'),
(NULL,NULL,'2020-02-15','Delivered','2020-02-15'),
(NULL,NULL,'2020-02-15','Cancelled','2020-02-15'),
(NULL,NULL,'2020-02-16','Delivered','2020-02-16'),
(NULL,NULL,'2020-02-17','Filled','2020-02-17'),
(NULL,NULL,'2020-02-18','Filled','2020-02-17'),
(NULL,NULL,'2020-02-18','Received','2020-02-18');

