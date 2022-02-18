-- Correlated subquery
-- Is a subquery that is executed once for each row processed by the outer query
-- take longer to run than a query with a noncorrelated subquery

-- Noncorrelated subquery
-- Is executed only once
-- Almost subquery is a noncorrelated subquery

use AP;
-- return invoice that's higher than average invoice of this vendor
Select VendorID, InvoiceNumber, InvoiceTotal
From Invoices AS Inv_Main
Where InvoiceTotal > 
	(Select AVG(InvoiceTotal)
	From Invoices AS Inv_Sub
	Where Inv_Sub.VendorID = Inv_Main.VendorID)
Order by VendorID, InvoiceTotal;


