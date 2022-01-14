use AP;

-- SELECT select_list
-- FROM table_source
-- WHERE search_condition
-- GROUP BY group_by_list
-- HAVING search_condition_for_group, limit groups in result set (cannot use alias column name)
-- ORDER BY order_by_list

-- select vendor id and avg invoice total of each vendor that > 2000
Select VendorID, AVG(InvoiceTotal) AS AverageInvoiceAmount
From Invoices
Group by VendorID
Having AVG(InvoiceTotal) > 2000
Order by AverageInvoiceAmount DESC;

-- count number of invoices by vendor
Select VendorID, COUNT(*) AS InvoiceQty
From Invoices
Group by VendorID
Order by InvoiceQty DESC;

-- calculate number of invoices, avg invoice amount for vendors in each state and city
Select VendorState, VendorCity, COUNT(*) AS InvoicesQty, AVG(InvoiceTotal) AS InvoiceAvg
From Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
Group by VendorState, VendorCity
Order by VendorState, VendorCity;

-- The same above request but just get group greater than 1 invoice
Select VendorState, VendorCity, COUNT(*) AS InvoicesQty, AVG(InvoiceTotal) AS InvoiceAvg
From Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
Group by VendorState, VendorCity
Having COUNT(*) >= 2
Order by VendorState, VendorCity;



-- different between HAVING and WHERE
-- search condition in WHERE is applied BEFORE the rows are grouped and aggregates are calculated
-- search condition in HAVING is applied AFTER the rows are grouped and aggregates are calculated
-- HAVING can only refer to a column included in SELECT or GROUP BY
-- WHERE can refer any columns in base tables
-- Aggregate function can only be coded in HAVING clause. WHERE clause cann't contain aggregate function

-- group by VendorName then filter groups have AVG invoice total > 500
Select VendorName, COUNT(*) AS InvoicesQty, AVG(InvoiceTotal) AS InvoiceAvg
From Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
Group by VendorName
Having AVG(InvoiceTotal) > 500
Order by InvoicesQty DESC;

-- filter Invoice total > 500 then group by VendorName
Select VendorName, COUNT(*) AS InvoicesQty, AVG(InvoiceTotal) AS InvoiceAvg
From Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
Where InvoiceTotal > 500
Group by VendorName
Order by InvoicesQty DESC;

-- compound condition in HAVING
Select InvoiceDate, COUNT(*) AS InvoicesQty, SUM(InvoiceTotal) AS InvoiceSum
From Invoices
Group by InvoiceDate
Having InvoiceDate BETWEEN '2012-01-01' AND '2012-01-31'
	AND COUNT(*) > 1
	AND SUM(InvoiceTotal) > 500
Order by InvoiceDate DESC;

-- compound condition in WHERE
Select InvoiceDate, COUNT(*) AS InvoicesQty, SUM(InvoiceTotal) AS InvoiceSum
From Invoices
Where InvoiceDate BETWEEN '2012-01-01' AND '2012-01-31'
Group by InvoiceDate
Having COUNT(*) > 1
	AND SUM(InvoiceTotal) > 500
Order by InvoiceDate DESC;
