-- EXISTS operator
-- test that one or more rows are retuned by the subquery
-- subquery doesn't actually return any rows. 
-- Instead it return an indication of whether any rows meet the specified condition
-- opfen use with correlated subqueries
-- because if't usually better to use a join than a noncorrelated subquery with EXISTS

use AP;

-- select all vendors that haven't invoice
Select VendorID, VendorName, VendorState
From Vendors
Where NOT EXISTS (Select * From Invoices Where Invoices.VendorID = Vendors.VendorID);
