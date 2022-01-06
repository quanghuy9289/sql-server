Select *
From Invoices;

Select InvoiceId, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredits
From Invoices
Where InvoiceID = 17;

Select InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices
Where InvoiceDate BETWEEN '2012-01-01' AND '2012-05-31'
Order by InvoiceDate

-- arithmetic expressions
Select InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
From Invoices

Select VendorContactFName + ' ' + VendorContactLName AS FullName
From Vendors

-- functions
Select InvoiceNumber, InvoiceDate, GETDATE() AS CurrentDate
From Invoices

Select VendorContactFName, VendorContactLName, LEFT(VendorContactFName, 1) + LEFT(VendorContactLName, 1) AS Initials
From Vendors

Select 'Invoice: #' + InvoiceNumber 
	+ ', dated ' + CONVERT(char(8), PaymentDate, 1)
	+ ' for $' + CONVERT(varchar(9), PaymentTotal, 1)
From Invoices;

Select InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age
From Invoices;


Select VendorName + '''s Address: ', VendorCity + ', ' + VendorState + ' ' + VendorZipCode
From Vendors;

Select VendorCity, VendorState
From Vendors
Order by VendorCity;

-- DISTINCT - prevent duplicate rows, and result set to be sorted by first column also
Select DISTINCT VendorCity, VendorState
From Vendors;

-- TOP clause - limit number of rows included in result set
-- should include ORDER BY clause whenever use the TOP keyword
Select TOP 5 VendorID, InvoiceTotal
From Invoices
Order by InvoiceTotal DESC;

-- first 5% 
Select TOP 5 PERCENT VendorID, InvoiceTotal
From Invoices
Order by InvoiceTotal DESC;

-- WITH TIES will get more rows that have the same value with the last row from TOP result set
Select TOP 5 WITH TIES VendorID, InvoiceTotal
From Invoices
Order by InvoiceTotal DESC;

-- ORDER BY
Select VendorID, InvoiceTotal
From Invoices
Order by InvoiceTotal DESC
	Offset 0 ROWS -- skip how many first rows
	FETCH FIRST 5 ROWS ONLY; -- limit how many rows retured, omit this will return all data

Select VendorName, VendorCity, VendorState, VendorZipCode
From Vendors
Where VendorState = 'CA'
Order By VendorCity
	Offset 10 ROWS
	Fetch next 10 ROWS ONLY;