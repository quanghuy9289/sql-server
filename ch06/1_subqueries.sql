use AP;

-- use subqueries in WHERE
Select InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices
Where InvoiceTotal >
	(Select AVG(InvoiceTotal) From Invoices)
Order by InvoiceTotal;

-- inner join and subqueries
-- join typically perform faster than the same query with a subquery
-- long, complex queries can be easier to code using subqueries
Select InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID
Where VendorState = 'CA'
Order by InvoiceDate;

Select InvoiceNumber, InvoiceDate, InvoiceTotal
From Invoices
Where VendorID IN 
	(Select VendorID From Vendors Where VendorState = 'CA')
Order by InvoiceDate;

-------------------------------------------

-- IN phrase
-- subquery must return a single column of values
-- subquery that use NOT IN can restate with OUTER JOIN

-- return vendors without invoices
Select VendorID, VendorName, VendorState
From Vendors
Where VendorID NOT IN 
	(Select DISTINCT VendorID From Invoices);

-- restate with LEFT join
Select Vendors.VendorID, VendorName, VendorState
From Vendors LEFT JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
Where Invoices.VendorID IS NULL;

-------------------------------------------

-- Compare expression with values return by subqueries
-- If search condition without the ANY|SOME|ALL keyworks, subqueries must return a single value
-- If include the ANY|SOME|ALL keyworks, subqueries can return a list of values

-- return invoices with a balance due less than average
Select InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
From Invoices
Where InvoiceTotal - PaymentTotal - CreditTotal > 0
	AND InvoiceTotal - PaymentTotal - CreditTotal < 
		(Select AVG(InvoiceTotal - PaymentTotal - CreditTotal)
		 From Invoices
		 Where InvoiceTotal - PaymentTotal - CreditTotal > 0)
Order by InvoiceTotal DESC;
