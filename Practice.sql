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









