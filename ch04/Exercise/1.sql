use AP;

Select Vendors.*
From Vendors
	INNER JOIN Invoices ON Vendors.VendorID = Invoices.InvoiceID
Order by VendorName;
