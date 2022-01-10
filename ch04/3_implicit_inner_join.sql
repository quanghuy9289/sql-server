use AP;

-- Select
-- From
-- Where
Select InvoiceNumber, VendorName
From Vendors, Invoices
Where Vendors.VendorID = Invoices.VendorID;

-- implicit INNER JOIN - 4 tables
Select VendorName, InvoiceNumber, InvoiceDate, InvoiceLineItemAmount AS LineItemAmount, AccountDescription
From Vendors, Invoices, InvoiceLineItems, GLAccounts
Where Vendors.VendorID = Invoices.VendorID
	AND Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	AND InvoiceLineItems.AccountNo = GLAccounts.AccountNo
	AND InvoiceTotal - PaymentTotal - CreditTotal > 0
Order by VendorName, LineItemAmount DESC;
