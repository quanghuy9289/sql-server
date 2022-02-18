use AP;

-------------------------------------------

-- ALL
-- search condition is TRUE for all values return by subqueries
-- Comparision operator: >, <, >=, <=
-- If subqueries return no value, ALL always TRUE
-- If subqueries return all rows contain a null value, ALL always FALSE

-- return invoices have total > the largest invoice total of vendor 34
Select VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
Where InvoiceTotal > ALL 
	(Select InvoiceTotal
	From Invoices
	Where Invoices.VendorID=34)
Order by VendorName;

-------------------------------------------

-- ANY the same with SOME
-- at least one  or OR operator
-- If subqueries return no value or subqueries return all rows contain a null value, ANY|SOME always FALSE

-- return invoices have total < the largest invoice total of vendor 115
Select Vendors.VendorID, VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
Where InvoiceTotal < ANY -- same with < largest
	(Select InvoiceTotal
	From Invoices
	Where Invoices.VendorID=115)
Order by VendorName;

-------------------------------------------

-- x > ANY (1,2) equivalent expression x > 1 ((1,2) is list returned by subqueries)
-- x must be greater than at least one of the values returned by the subquery list,
-- that mean it must be greater than the minimum value returned by the subquery

-- x < ANY(1,2) equivalent expression x < 2

-- x = ANY(1,2) => (x=1) OR (x=2) => x IN (1,2)

-- x <> ANY(1,2) => (x<>1) OR (x<>2)