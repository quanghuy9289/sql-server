use AP;

Select VendorName, DefaultAccountNo, AccountDescription
From Vendors
	INNER JOIN GLAccounts ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
Order by AccountDescription, VendorName;

