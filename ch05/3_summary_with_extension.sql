use AP;

--------------------------------------------------------

-- ROLLUP
-- add a summary row for each group specified (if GROUP BY > 1 group)
-- and add a final summary row to the end of result set that summarized the entire result set
-- sort Order By will run after summary row is added
-- Cann't use DISTINCT with ROLLUP
Select VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceTotal
From Invoices
-- Group By VendorID WITH ROLLUP; OR
Group By ROLLUP(VendorID);

Select VendorState, VendorCity, COUNT(*) AS QtyVendors
From Vendors
Where VendorState in ('IA', 'NJ')
Group by VendorState, VendorCity WITH ROLLUP
Order by VendorState DESC, VendorCity DESC;

--------------------------------------------------------

-- CUBE
-- add a summary row for each group specified (if GROUP BY > 1 group)
-- and add a final summary row to the end of result set that summarized the entire result set
-- Cann't use DISTINCT with ROLLUP

Select VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceTotal
From Invoices
-- Group By VendorID WITH CUBE; OR
Group By CUBE(VendorID);


Select VendorState, VendorCity, COUNT(*) AS QtyVendors
From Vendors
Where VendorState in ('IA', 'NJ')
-- Group by VendorState, VendorCity WITH CUBE OR
Group By CUBE(VendorState, VendorCity) -- add summary rows for each city also
Order by VendorState DESC, VendorCity DESC;

--------------------------------------------------------

-- GROUPING SETS
-- add a summary row for each group specified (if GROUP BY > 1 group)

Select VendorState, VendorCity, COUNT(*) AS QtyVendors
From Vendors
Where VendorState in ('IA', 'NJ')
Group By GROUPING SETS(VendorState, VendorCity) -- just return summary rows
Order by VendorState DESC, VendorCity DESC;


Select VendorState, VendorCity, VendorZipCode, COUNT(*) AS QtyVendors
From Vendors
Where VendorState in ('IA', 'NJ')
-- Group By GROUPING SETS((VendorState, VendorCity), VendorZipCode, ()) -- just return summary rows OR
Group By GROUPING SETS(ROLLUP(VendorState, VendorCity),VendorZipCode) 
Order by VendorState DESC, VendorCity DESC;

--------------------------------------------------------

-- OVER
-- let you summarize the date in result set and return rows are used to calculate summary also
Select InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
From Invoices;
