use AP;

-- Union - combine result from all tables
-- Required result set: same no. columns, same data types of columns
-- Default: union eliminate duplicate rows
-- If want to include duplicate rows, add ALL keywork 
-- Column name is taken from first SELECT
-- Order by by column name in first SELECT

	Select 'Active' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
	From Invoices
	Where InvoiceTotal - PaymentTotal - CreditTotal > 0
UNION -- [ALL]
	Select 'Pay' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
	From Invoices
	Where InvoiceTotal - PaymentTotal - CreditTotal <= 0
ORDER BY InvoiceTotal DESC;
