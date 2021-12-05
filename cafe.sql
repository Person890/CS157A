DROP DATABASE IF EXISTS CAFE;
CREATE DATABASE CAFE;
USE CAFE;

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE
(
  employeeID INT AUTO_INCREMENT,
  name VARCHAR(50),
  position VARCHAR(50),
  salary FLOAT,
  PRIMARY KEY (employeeID)
);
ALTER TABLE EMPLOYEE AUTO_INCREMENT = 101;

DROP TABLE IF EXISTS SUPPLIER;
CREATE TABLE SUPPLIER
(
  name VARCHAR(50),
  type VARCHAR(50),
  cost FLOAT,
  stock INT,
  PRIMARY KEY (name, type)
);

DROP TABLE IF EXISTS COFFEESELECTION;
CREATE TABLE COFFEESELECTION
(
  drink VARCHAR(50),
  size VARCHAR(50),
  type VARCHAR(50),
  roast VARCHAR(50),
  price FLOAT,
  stock INT,
  PRIMARY KEY (drink, size)
  -- FOREIGN KEY (type) REFERENCES SUPPLIER (type)
  -- ON UPDATE CASCADE
  -- ON DELETE SET NULL
);

DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER
(
  name VARCHAR(50),
  favoriteDrink VARCHAR(50),
  PRIMARY KEY (name),
  FOREIGN KEY (favoriteDrink) REFERENCES COFFEESELECTION (drink)
);

DROP TABLE IF EXISTS TRANSACTION;
CREATE TABLE TRANSACTION
(
  transactionID INT AUTO_INCREMENT,
  employeeID INT,
  customer VARCHAR(50),
  size VARCHAR(50),
  drinkOrder VARCHAR(50),
  total FLOAT,
  updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (transactionID),
  FOREIGN KEY (employeeID) REFERENCES EMPLOYEE (employeeID)
  ON UPDATE CASCADE
  ON DELETE SET NULL,
  FOREIGN KEY (customer) REFERENCES CUSTOMER (name)
  ON UPDATE CASCADE
  ON DELETE SET NULL,
  FOREIGN KEY (drinkOrder) REFERENCES COFFEESELECTION (drink)
  ON UPDATE CASCADE
  ON DELETE SET NULL
  /*FOREIGN KEY (total) REFERENCES COFFEESELECTION (price)*/
);
ALTER TABLE TRANSACTION AUTO_INCREMENT = 1001;

DROP TRIGGER IF EXISTS StockUpdateTrigger;
CREATE TRIGGER StockUpdateTrigger
  AFTER INSERT ON TRANSACTION
  FOR EACH ROW
  UPDATE COFFEESELECTION
  SET STOCK = STOCK - 1
  WHERE COFFEESELECTION.drink = NEW.drinkOrder AND COFFEESELECTION.size = NEW.size;


/* Employees */
INSERT INTO EMPLOYEE (name, position, salary) VALUES ('Paul', 'barista', 18.50);
INSERT INTO EMPLOYEE (name, position, salary) VALUES ('James', 'barista', 18.50);
INSERT INTO EMPLOYEE (name, position, salary) VALUES ('Anna', 'manager', 22.50);
INSERT INTO EMPLOYEE (name, position, salary) VALUES ('Julian', 'manager', 22.50);

/* Supplier */
INSERT INTO SUPPLIER VALUES ('Starbucks', 'arabica', 20.21, 50);
INSERT INTO SUPPLIER VALUES ('Starbucks', 'robusta', 23.87, 50);
INSERT INTO SUPPLIER VALUES ('Starbucks', 'liberica', 24.26, 50);
INSERT INTO SUPPLIER VALUES ('Peet\'s', 'arabica', 19.43, 50);
INSERT INTO SUPPLIER VALUES ('Peet\'s', 'robusta', 22.17, 50);
INSERT INTO SUPPLIER VALUES ('Peet\'s', 'liberica', 23.59, 50);
/* Coffee Selection */
INSERT INTO COFFEESELECTION VALUES ('latte', 'small', 'arabica', 'medium', 3.50, 30);
INSERT INTO COFFEESELECTION VALUES ('latte', 'medium', 'arabica', 'medium', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('latte', 'large', 'arabica', 'medium', 5.50, 30);

INSERT INTO COFFEESELECTION VALUES ('mocha', 'small', 'arabica', 'medium', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('mocha', 'medium', 'arabica', 'medium', 5.25, 30);
INSERT INTO COFFEESELECTION VALUES ('mocha', 'large', 'arabica', 'medium', 6.00, 30);

INSERT INTO COFFEESELECTION VALUES ('macchiato', 'small', 'arabica', 'light', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('macchiato', 'medium', 'arabica', 'light', 5.50, 30);
INSERT INTO COFFEESELECTION VALUES ('macchiato', 'large', 'arabica', 'light', 6.50, 30);

INSERT INTO COFFEESELECTION VALUES ('americano', 'small', 'liberica', 'medium', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('americano', 'medium', 'liberica', 'medium', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('americano', 'large', 'liberica', 'medium', 4.50, 30);

INSERT INTO COFFEESELECTION VALUES ('red eye', 'small', 'robusta', 'dark', 3.50, 30);
INSERT INTO COFFEESELECTION VALUES ('red eye', 'medium', 'robusta', 'dark', 4.00, 30);
INSERT INTO COFFEESELECTION VALUES ('red eye', 'large', 'robusta', 'dark', 4.50, 30);

INSERT INTO COFFEESELECTION VALUES ('flat white', 'small', 'arabica', 'light', 4.00, 30);
INSERT INTO COFFEESELECTION VALUES ('flat white', 'medium', 'arabica', 'light', 4.75, 30);
INSERT INTO COFFEESELECTION VALUES ('flat white', 'large', 'arabica', 'light', 5.50, 30);

INSERT INTO COFFEESELECTION VALUES ('black', 'small', 'robusta', 'dark', 3.00, 30);
INSERT INTO COFFEESELECTION VALUES ('black', 'medium', 'robusta', 'dark', 3.50, 30);
INSERT INTO COFFEESELECTION VALUES ('black', 'large', 'robusta', 'dark', 3.75, 30);

INSERT INTO COFFEESELECTION VALUES ('cappuccino', 'small', 'liberica', 'medium', 4.00, 30);
INSERT INTO COFFEESELECTION VALUES ('cappuccino', 'medium', 'liberica', 'medium', 4.50, 30);
INSERT INTO COFFEESELECTION VALUES ('cappuccino', 'large', 'liberica', 'medium', 5.00, 30);

/* Customers */
INSERT INTO CUSTOMER VALUES ('Sandra', 'mocha');
INSERT INTO CUSTOMER VALUES ('Bob', 'black');
INSERT INTO CUSTOMER VALUES ('Krishnaa', 'macchiato');
INSERT INTO CUSTOMER VALUES ('Tony', 'red eye');
INSERT INTO CUSTOMER VALUES ('Karen', 'flat white');
INSERT INTO CUSTOMER VALUES ('Michelle', 'cappuccino');
INSERT INTO CUSTOMER VALUES ('Jorge', 'mocha');
INSERT INTO CUSTOMER VALUES ('Erik', 'black');
INSERT INTO CUSTOMER VALUES ('Sunny', 'latte');

/* Transactions */
INSERT INTO TRANSACTION (employeeID, customer, size, drinkOrder, total) VALUES (101, 'Sandra', 'medium', 'latte', 4.50);
INSERT INTO TRANSACTION (employeeID, customer, size, drinkOrder, total) VALUES (102, 'Bob', 'medium', 'black', 3.50);
INSERT INTO TRANSACTION (employeeID, customer, size, drinkOrder, total) VALUES (103, 'Tony', 'small', 'mocha', 4.50);
INSERT INTO TRANSACTION (employeeID, customer, size, drinkOrder, total) VALUES (102, 'Karen', 'large', 'flat white', 5.50);
INSERT INTO TRANSACTION (employeeID, customer, size, drinkOrder, total) VALUES (104, 'Erik', 'medium', 'latte', 4.50);

CREATE PROCEDURE STORED_TRANSACTION
AS
CREATE TABLE IF NOT EXISTS ARCHIVEDTRANSACTION (
  transactionID INT AUTO_INCREMENT,
  employeeID INT,
  customer VARCHAR(50),
  size VARCHAR(50),
  drinkOrder VARCHAR(50),
  total FLOAT,
  updatedAt TIMESTAMP
);

INSERT INTO ARCHIVEDTRANSACTION
SELECT *
FROM TRANSACTION
WHERE DATE(updatedAt) < '2021-11-30';

DELETE FROM TRANSACTION
WHERE DATE(updatedAt) < '2021-11-30';

GO;
