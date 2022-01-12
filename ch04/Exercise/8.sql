use AP;

	Select VendorName, VendorCity, VendorState
	From Vendors
	Where VendorState = 'CA'
UNION
	Select VendorName, VendorCity, 'Outside CA'
	From Vendors
	Where VendorState <> 'CA'
Order by VendorName;
