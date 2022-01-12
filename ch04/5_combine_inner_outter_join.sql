use Examples;

-- Combine INNER JOIN and OUTTER JOIN
-- Can't combine inner and outter using implicit syntax (Select From Where)


-- Query all employee in that allocated in department and project they're working on
Select DeptName, LastName, ProjectNo
From Departments
	JOIN Employees ON Departments.DeptNo = Employees.DeptNo
	LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID
Order By DeptName;
