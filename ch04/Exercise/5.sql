use AP;

Select VendorName AS Vendor, InvoiceDate AS Date, InvoiceNumber AS Number, InvoiceSequence AS #, InvoiceLineItemAmount AS LineItem
From Vendors AS v
	INNER JOIN Invoices AS i ON v.VendorID = i.InvoiceID
	INNER JOIN InvoiceLineItems AS li ON i.InvoiceID = li.InvoiceID
Order by Vendor, Date, Number, #;

