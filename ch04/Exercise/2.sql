use AP;

Select VendorName, InvoiceNumber, InvoiceDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS Balance 
From Vendors
	INNER JOIN Invoices ON Vendors.VendorID = Invoices.InvoiceID
Where InvoiceTotal - PaymentTotal - CreditTotal > 0
Order by VendorName;
