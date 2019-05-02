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

