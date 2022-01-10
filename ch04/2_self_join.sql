use AP;

-- self-join join a table with itself
-- need use correlation name for table
-- include DISTINCT keywork to eliminate duplicate rows
Select DISTINCT Vendors1.VendorName, Vendors1.VendorCity, Vendors1.VendorState
From Vendors AS Vendors1 JOIN Vendors AS Vendors2
	ON Vendors1.VendorCity = Vendors2.VendorCity
	AND Vendors1.VendorState = Vendors2.VendorState
	AND Vendors1.VendorID <> Vendors2.VendorID
Order By Vendors1.VendorState, vendors1.VendorCity;
