use AP;

-- OUTTER JOIN
-- LEFT|RIGHT|FULL JOIN
-- retrieves all rows that satify join condition , plus unmatched rows in one or both tables - table in LEFT, RIGHT or both (FULL)
-- when row with unmatched columns is retrieved, any columns from other tables is given NULL value
Select VendorName, InvoiceNumber ,InvoiceTotal
From Vendors LEFT JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
Order By VendorName;


Use Examples;

-- LEFT JOIN
-- Select employees from all departments (include department not include any employee)
Select Departments.DeptName, Departments.DeptNo, LastName
From Departments LEFT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo
Order By Departments.DeptName;

-- RIGHT JOIN
-- Select all employees (include employees that not put in any department
Select Departments.DeptName, Employees.DeptNo, LastName
From Departments RIGHT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo


-- FULL JOIN
-- Select all employees (include employees that not put in any department and all department that not include any employee)
Select Departments.DeptName, Departments.DeptNo, Employees.DeptNo, LastName
From Departments FULL JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;


-- OUTTER JOIN - more than 2 tables
-- LEFT JOIN
Select Departments.DeptName, LastName, ProjectNo
From Departments 
	LEFT JOIN Employees ON Departments.DeptNo = Employees.DeptNo
	LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID
Order By DeptName, LastName, ProjectNo;

-- OUTTER JOIN - more than 2 tables
-- FULL JOIN
Select Departments.DeptName, LastName, ProjectNo
From Departments 
	FULL JOIN Employees ON Departments.DeptNo = Employees.DeptNo
	FULL JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID
Order By DeptName, LastName, ProjectNo;