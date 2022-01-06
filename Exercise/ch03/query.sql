Use AP;

-- 1.
Select VendorContactFName, VendorContactLName, VendorName
From Vendors
Order By VendorContactLName, VendorContactFName;

-- 2.
Select InvoiceNumber AS Number, InvoiceTotal AS Total, PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
From Invoices;

-- 3.
Select VendorContactLName + ', ' + VendorContactFName AS [Full Name]
From Vendors
Order By VendorContactLName, VendorContactFName;

-- 4.
Select InvoiceTotal, InvoiceTotal * 0.1 AS [10%], InvoiceTotal*1.1 AS [Plus 10%]
From Invoices
Where (InvoiceTotal - PaymentTotal - CreditTotal) > 1000
Order By InvoiceTotal DESC;

-- 5.
Select InvoiceNumber AS Number, InvoiceTotal AS Total, PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
From Invoices
Where InvoiceTotal BETWEEN 500 AND 10000;

-- 6.
Select VendorContactLName + ', ' + VendorContactFName AS [Full Name]
From Vendors
Where LEFT(VendorContactLName, 1) LIKE '[ABCE]'
Order By VendorContactLName, VendorContactFName;

-- 7. Select invoices with invalid PaymentDate column
Select *
From Invoices
Where ((InvoiceTotal - PaymentTotal - CreditTotal) <> 0 AND PaymentDate IS NOT NULL)
	OR ((InvoiceTotal - PaymentTotal - CreditTotal) = 0 AND PaymentDate IS NULL);

