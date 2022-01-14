use AP;

-- AVG([ALL|DISTINCT] expression) => non null value, expression result in numeric value
-- SUM([ALL|DISTINCT] expression) => non null value, expression result in numeric value

-- MIN([ALL|DISTINCT] expression), MAX([ALL|DISTINCT] expression), COUNT([ALL|DISTINCT] expression) => non null value, expression result in numeric|date|string value
-- COUNT(*) => all rows

-- Count unpaid invoices, calculate total deal
Select COUNT(*) AS NumberOfInvoices,
	SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
From Invoices
Where InvoiceTotal - PaymentTotal - CreditTotal > 0;

-- Count number of invoices, calculate avg and total invoice after 9/1/2012
Select 'After 9/1/2012' AS SelectionDate, COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
From Invoices
Where InvoiceDate > '2012-01-09';

-- Count number of invoices, find min, max of total invoice after 9/1/2012
Select 'After 9/1/2012' AS SelectionDate, COUNT(*) AS NumberOfInvoices,
	MAX(InvoiceTotal) AS HighestInvoiceTotal,
	MIN(InvoiceTotal) AS LowestInvoiceTotal
From Invoices
Where InvoiceDate > '2012-01-09';

-- Find first vendor and last vendor in alphabet
Select MIN(VendorName) AS FirstVendor,
	MAX(VendorName) AS LastVendor,
	COUNT(VendorName) AS NumberOfVendors
From Vendors;

-- Count number of vendors, number of invoices, calculate avg and total invoice after 9/1/2012
Select COUNT(DISTINCT VendorID) AS NumberOfVendors, COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
From Invoices
Where InvoiceDate > '2012-01-09';
