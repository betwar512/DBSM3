CREATE VIEW dbo.OfficeWorkerView
WITH SCHEMABINDING
 AS
	SELECT E.Employee_Id as Id,E.Name,E.Phone,E.Email,E.Address,E.Salary,E.Sex,O.Department_Id 
		FROM dbo.Employee AS E, dbo.Office_worker AS O 
			WHERE E.Employee_Id = O.Employee_Id;
GO
CREATE UNIQUE CLUSTERED INDEX IDX_V2
	ON dbo.OfficeWorkerView(Id);

-- =============================================
-- Create Clustered Columnstore Index template
-- Use the Specify Values for Template Parameters command (Ctrl-Shift-M) to fill in the parameter values below.
-- This template creates a clustered columnstore index.
-- =============================================