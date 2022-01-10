use AP;

-- INNER JOIN - [INNER] is option
Select InvoiceNumber, VendorName
From Vendors JOIN Invoices ON Vendors.VendorID = Invoices.VendorID;

-- INNER JOIN - use correlation name (table alias)
Select InvoiceNumber, InvoiceLineItemAmount, InvoiceLineItemDescription
From Invoices JOIN InvoiceLineItems AS LineItems ON Invoices.InvoiceID = LineItems.InvoiceID
Where AccountNo=540
Order By InvoiceDate;

-- INNER JOIN from different database
-- Access table name with fully-qualified object name: [linked_server.database.schema.object]
-- or partially- qualified table name: [database..table]
Select VendorName, CustLastName, CustFirstName, VendorState AS State, VendorCity AS City
From Vendors
	JOIN ProductOrders..Customers AS Customers -- schema is omit
	ON Vendors.VendorZipCode = Customers.CustZip
Order By State, City;

-- INNER JOIN - compound JOIN conditions in INNER JOIN
Select InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
From Invoices JOIN InvoiceLineItems AS LineItems 
	ON Invoices.InvoiceID = LineItems.InvoiceID
	AND Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount
Order By InvoiceNumber;

-- INNER JOIN - compound JOIN conditions in WHERE clause
-- Should code JOIN table ON and search condition in Where clause like this
Select InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
From Invoices JOIN InvoiceLineItems AS LineItems 
	ON Invoices.InvoiceID = LineItems.InvoiceID
Where Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount
Order By InvoiceNumber;

-- INNER JOIN - 4 tables
Select VendorName, InvoiceNumber, InvoiceDate, InvoiceLineItemAmount AS LineItemAmount, AccountDescription
From Vendors
	JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
Where InvoiceTotal - PaymentTotal - CreditTotal > 0
Order by VendorName, LineItemAmount DESC;
