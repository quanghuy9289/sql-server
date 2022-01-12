use AP;

Select DISTINCT Vendors1.VendorID, Vendors1.VendorName, Vendors1.VendorContactFName + ' ' + Vendors1.VendorContactLName AS Name
From Vendors AS Vendors1 JOIN Vendors AS Vendors2
	ON Vendors1.VendorID <> Vendors2.VendorID
	AND Vendors1.VendorContactFName = Vendors2.VendorContactFName
Order by Name;


