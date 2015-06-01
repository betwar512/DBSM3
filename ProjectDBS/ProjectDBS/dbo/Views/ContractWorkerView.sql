CREATE VIEW  dbo.ContractWorkerView
WITH SCHEMABINDING
AS
 SELECT E.Employee_Id AS Id,E.Name,E.Phone,E.Email,E.Address,E.Salary,E.Sex, C.Specialization 
	FROM dbo.Employee AS E 
	INNER JOIN dbo.Contract_worker AS C 
		ON E.Employee_Id=C.Employee_id;
GO
CREATE UNIQUE CLUSTERED INDEX IDX_V1
ON dbo.ContractWorkerView(Id);