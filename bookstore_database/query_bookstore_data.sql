-- Use the created database
USE `BookstoreDB`;

-- 1. Retrieve data by joining Customers, Orders, OrderDetails, and Books
SELECT `c`.`Name` AS `CustomerName`, `o`.`OrderDate`, `b`.`Title` AS `BookTitle`, `od`.`Quantity`
FROM `Customers` `c`
JOIN `Orders` `o` ON `c`.`CustomerID` = `o`.`CustomerID`
JOIN `OrderDetails` `od` ON `o`.`OrderID` = `od`.`OrderID`
JOIN `Books` `b` ON `od`.`ISBN` = `b`.`ISBN`;

-- 2. Update book price and verify the update
UPDATE `Books` SET `Price` = 8.99 WHERE `ISBN` = '9781234567890';
SELECT * FROM `Books` WHERE `ISBN` = '9781234567890';

-- 3. Delete an order detail and verify the deletion
DELETE FROM `OrderDetails` WHERE `OrderID` = 1 AND `ISBN` = '9780321765723';
SELECT * FROM `OrderDetails` WHERE `OrderID` = 1;

-- 4. List books by their authors
SELECT `a`.`Name` AS `AuthorName`, `b`.`Title` AS `BookTitle`
FROM `Authors` `a`
JOIN `BookAuthors` `ba` ON `a`.`AuthorID` = `ba`.`AuthorID`
JOIN `Books` `b` ON `ba`.`ISBN` = `b`.`ISBN`;

-- 5. Find customers who ordered books by a specific author
SELECT `c`.`Name` AS `CustomerName`
FROM `Customers` `c`
JOIN `Orders` `o` ON `c`.`CustomerID` = `o`.`CustomerID`
JOIN `OrderDetails` `od` ON `o`.`OrderID` = `od`.`OrderID`
JOIN `Books` `b` ON `od`.`ISBN` = `b`.`ISBN`
JOIN `BookAuthors` `ba` ON `b`.`ISBN` = `ba`.`ISBN`
JOIN `Authors` `a` ON `ba`.`AuthorID` = `a`.`AuthorID`
WHERE `a`.`Name` = 'Douglas Adams'; -- Change the author name as needed
