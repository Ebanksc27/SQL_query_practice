-- Add a product with the name of "chair", price of 44.00, and can_be_returned of false --
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

-- Add a product with the name of "stool", price of 25.99, and can_be_returned of true: --
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

-- Add a product with the name of "table", price of 124.00, and can_be_returned of false --
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);

-- Display all of the rows and columns in the table --
SELECT * FROM products;

-- Display all of the names of the products --
SELECT name FROM products;

-- Display all of the names and prices of the products --
SELECT name, price FROM products;

-- Add a new product -- 
INSERT INTO products (name, price, can_be_returned) VALUES ('desk', 199.99, true);

-- Display only the products that can_be_returned -- 
SELECT * FROM products WHERE can_be_returned = true;

-- Display only the products that have a price less than 44.00 -- 
SELECT * FROM products WHERE price < 44.00;

-- Display only the products that have a price in between 22.50 and 99.99 --
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Everything is $20 off!  --
UPDATE products SET price = price - 20;

-- Remove all products whose price meets the criteria of less than $25 -- 
DELETE FROM products WHERE price < 25;

--     For the remaining products, increase their price by $20 --
UPDATE products SET price = price + 20;

-- New company policy: everything is returnable. -- 
UPDATE products SET can_be_returned = true;
