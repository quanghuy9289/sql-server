use ProductOrders;

-- EXCEPT
-- Exclude rows from first query if they also occur in second query (giong nhau thi loai ra, giu lai ben first table)
	Select CustFirstName, CustLastName
	From Customers
EXCEPT
	Select FirstName, LastName
	From Examples.dbo.Employees
Order By CustLastName;

-- INTERSECT
-- Include rows that occur in both queries (giong nhau thi giu lai)
	Select CustFirstName, CustLastName
	From ProductOrders.dbo.Customers
INTERSECT
	Select FirstName, LastName
	From Examples.dbo.Employees
Order By CustLastName;