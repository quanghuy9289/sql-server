use AP;

-- 1
Select VendorID, SUM(PaymentTotal) AS PaymentSum
From Invoices
Group By VendorID;


-- 2
Select TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
From Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
Group By VendorName
Order by PaymentSum DESC;


-- 3
Select VendorName, COUNT(InvoiceNumber), SUM(InvoiceTotal) AS InvoiceSum
From Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
Group By VendorName
Order by COUNT(InvoiceNumber) DESC;


-- 4
Select AccountDescription, COUNT(*) AS LineItemCount , SUM(InvoiceLineItemAmount) LineItemSum
From GLAccounts JOIN InvoiceLineItems ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
Group By AccountDescription
HAVING COUNT(*) > 1
Order by LineItemCount DESC;


-- 5
Select AccountDescription, COUNT(*) AS LineItemCount , SUM(InvoiceLineItemAmount) LineItemSum
From GLAccounts JOIN InvoiceLineItems ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
	JOIN Invoices ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
Where InvoiceDate BETWEEN '2012-01-01' AND '2012-01-31'
Group By AccountDescription
HAVING COUNT(*) > 1
Order by LineItemCount DESC;


-- 6
Select GLAccounts.AccountNo, SUM(InvoiceLineItemAmount) LineItemSum
From GLAccounts JOIN InvoiceLineItems ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
Group By GLAccounts.AccountNo WITH ROLLUP
Order by LineItemSum DESC;



-- 7
Select VendorName, AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
From Vendors JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
Group By VendorName, AccountDescription WITH ROLLUP
Order by VendorName DESC, AccountDescription DESC;


-- 8
Select VendorName, COUNT(DISTINCT InvoiceLineItems.AccountNo) AS [# of Accounts]
From Vendors JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
Group By VendorName
Having COUNT(DISTINCT InvoiceLineItems.AccountNo) > 1
Order by VendorName;

-- 9
SELECT VendorID, InvoiceDate, InvoiceTotal,
    SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal,
    COUNT(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorCount,
    AVG(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorAvg
FROM Invoices;