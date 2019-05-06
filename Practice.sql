/*Problem: List all customers*/
select *
FROM Customer;

/*Problem: List the first name, last name, and city of all customers*/

SELECT FirstName, LastName, City
  FROM Customer;

/*A WHERE clause with a SELECT statement: */
SELECT Id, FirstName, LastName, City, Country, Phone
  FROM Customer
 WHERE Country = 'Sweden'

/*Problem: Update the city to Sydney for supplier Pavlova, Ltd. */
UPDATE Supplier
   SET City = 'Sydney'
 WHERE CompanyName = 'Pavlova, Ltd.'

 /*Problem: Delete all products with unit price higher than $50.  */
 DELETE  FROM Product
 WHERE UnitPrice > 50

 /*Note: Referential integrity may prevent this deletion. 
A better approach may be to discontinue the product, that is, set IsDiscontinued to true.*/

UPDATE Product 
SET IsDiscontinued = 'true'
WHERE UnitPrice > 50;

/*Problem: Add a record for a new customer*/
INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
VALUES ('Craig', 'Smith', 'New York', 'USA', '1-01-993 2800')

/*Problem: Add a new customer named Anita Coats to the database*/
INSERT INTO Customer (FirstName, LastName)
VALUES ('Anita', 'Coats');

/*The SQL INSERT combined with a SELECT
Problem: The Bigfoot Brewery supplier is also a customer. 
Add a customer record with values from the supplier table.
*/
INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
SELECT LEFT(ContactName, CHARINDEX(' ',ContactName) - 1), 
       SUBSTRING(ContactName, CHARINDEX(' ',ContactName) + 1, 100), 
       City, Country, Phone
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'

 /*CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )*/
 /* SUBSTRING(string, start, length)*/
 SELECT LEFT(ContactName, CHARINDEX(' ',ContactName) - 1), 
       SUBSTRING(ContactName, CHARINDEX(' ',ContactName) + 1, 100), 
       City, Country, Phone
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'

  select SUBSTRING(ContactName,2,100)
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'

 SELECT LEFT(ContactName, CHARINDEX(' ',ContactName) - 1), 
       SUBSTRING(ContactName, CHARINDEX(' ',ContactName) + 1, 100), 
       City, Country, Phone
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'


 select SUBSTRING(ContactName,2,100)
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'


 select *
   FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'

 SELECT SUBSTRING(ContactName, CHARINDEX(' ',ContactName) + 1, 100)
 from Supplier	
  WHERE CompanyName = 'Bigfoot Breweries'
 ;

 /*Problem: discontinue all products in the database*/

 UPDATE Product
   SET IsDiscontinued = 1
/*Problem: Discontinue products over $50.*/


UPDATE Product
   SET IsDiscontinued = 1
 WHERE UnitPrice > 50

 /*Problem: Discontinue product with Id = 46.*/

 UPDATE Product
   SET IsDiscontinued = 1
 WHERE Id = 46
 /*Problem: Supplier Norske Meierier (Id = 15) has moved: update their city, phone and fax.*/

 UPDATE Supplier
   SET City = 'Oslo', Phone = '(0)1-953530', Fax = '(0)1-953555'
 WHERE Id = 15

/* Problem: Delete all products.*/
DELETE Product
DELETE Product
 WHERE UnitPrice > 50

 DELETE Customer
 WHERE Id = 21

 /*List all suppliers in alphabetical order*/
 SELECT CompanyName, ContactName, City, Country
  FROM Supplier
 ORDER BY CompanyName

 SELECT CompanyName, ContactName, City, Country
  FROM Supplier
 ORDER BY CompanyName DESC

 /*Problem: List all customers ordered by country, then by city within each country
Ordering by one or more columns is possible.*/
SELECT FirstName, LastName, City, Country
  FROM Customer
 ORDER BY Country, City

 /*Problem: List all suppliers in the USA, Japan, and Germany, ordered by city, 
then by company name in reverse order*/
SELECT Id, CompanyName, City, Country
  FROM Supplier
 WHERE Country IN ('USA', 'Japan', 'Germany')
 ORDER BY Country ASC, CompanyName DESC
 /*Problem: List top 10 most expensive products*/
 SELECT TOP 10 Id, ProductName, UnitPrice, Package
  FROM Product
 ORDER BY UnitPrice DESC

/* Problem: Get all but the 10 most expensive products sorted by price*/
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 ORDER BY UnitPrice DESC
OFFSET 10 ROWS

/*Get the 10th to 15th most expensive products sorted by price*/

SELECT Id, ProductName, UnitPrice, Package
FROM Product
ORDER BY UnitPrice DESC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY


/*Problem: List all supplier countries in alphabetical order.*/

SELECT DISTINCT Country
  FROM Supplier
ORDER BY COUNTRY

/*Problem: List the number of supplier countries*/

SELECT COUNT (DISTINCT Country)
  FROM Supplier
  /*Problem: Find the cheapest product*/
  SELECT MIN(UnitPrice)
  FROM Product

/*Problem: Find the largest order placed in 2014*/
SELECT MAX(TotalAmount)
  FROM [Order]
 WHERE YEAR(OrderDate) = 2014

/*Problem: Find the last order date in 2013*/

SELECT MAX(orderDate)
FROM [Order]
WHERE YEAR(OrderDate) = 2013

/*Problem: Find the number of customers*/
SELECT COUNT(Id)
  FROM Customer

/*Problem: Compute the total amount sold in 2013*/
SELECT SUM(TotalAmount)
FROM [Order]
WHERE YEAR(OrderDate) = 2013

/*Problem: Compute the average size of all orders*/
SELECT AVG(TotalAmount)
  FROM [Order]

/*Problem: Get customer named Thomas Hardy */

SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE FirstName = 'Thomas' AND LastName = 'Hardy'


/* Problem: List all customers from Spain or France*/

SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE Country = 'Spain' OR Country = 'France'

/*Problem: List all customers that are not from the USA*/
SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE NOT Country = 'USA'

 /*Problem: List all orders that not between $50 and $15000*/
 SELECT Id, OrderDate, CustomerId, TotalAmount
  FROM [Order]
 WHERE NOT (TotalAmount >= 50 AND TotalAmount <= 15000)
 ORDER BY TotalAmount DESC

  SELECT Id, OrderDate, CustomerId, TotalAmount
  FROM [Order]
 WHERE TotalAmount NOT between 50 AND 15000
 ORDER BY TotalAmount DESC
 /*Problem: List all products between $10 and $20*/

 SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice BETWEEN 10 AND 20
 ORDER BY UnitPrice

 /*Problem: List all products not between $10 and $100 sorted by price.*/

SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice NOT BETWEEN 5 AND 100
 ORDER BY UnitPrice

 /*Problem: Get the number of orders and amount sold between Jan 1, 2013 and Jan 31, 2013.*/
 SELECT COUNT(Id), SUM(TotalAmount)
  FROM [Order]
 WHERE OrderDate BETWEEN '1/1/2013' AND '1/31/2013'
/* Problem: List all suppliers from the USA, UK, OR Japan*/
SELECT Id, CompanyName, City, Country
  FROM Supplier
 WHERE Country IN ('USA', 'UK', 'Japan')

 /*Problem: List all products that are not exactly $10, $20, $30, $40, or $50*/

 SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice NOT IN (10,20,30,40,50)

/*Problem: List all customers that are from  the same countries as the suppliers.*/

SELECT Id, FirstName, LastName, Country
  FROM Customer
 WHERE Country IN 
       (SELECT Country 
          FROM Supplier) 

/*Problem: List all products with names that start with 'Ca'*/
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 WHERE ProductName LIKE 'Ca%'

 /*Problem: List all products that start with 'Cha' or 'Chan' and have one more character.*/
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 WHERE ProductName LIKE 'Cha_' OR ProductName LIKE 'Chan_'

 /*Problem: List all suppliers that have no fax number*/
SELECT Id, CompanyName, Phone, Fax 
  FROM Supplier
 WHERE Fax IS NULL

 /*Problem: List all suppliers that do have a fax number*/

 SELECT Id, CompanyName, Phone, Fax 
  FROM Supplier
 WHERE Fax IS NOT NULL

 /*Problem: List the number of customers in each country */

 SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country

 /*Problem: List the number of customers in each country sorted high to low */
 SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country
 ORDER BY COUNT(Id) DESC

 /*Problem: List the total amount ordered for each customer */

 SELECT SUM(O.TotalAmount), C.FirstName, C.LastName
  FROM [Order] O JOIN Customer C 
    ON O.CustomerId = C.Id
 GROUP BY C.FirstName, C.LastName
 ORDER BY SUM(O.TotalAmount) DESC

 /*Problem: List the number of customers in each country. Only include countries with more than 10 customers. */
 SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country
HAVING COUNT(Id) > 10


