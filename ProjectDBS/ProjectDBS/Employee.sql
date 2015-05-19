CREATE TABLE [dbo].[Employee]
(
	[Employee_Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NULL, 
    [Salary] NUMERIC NULL, 
    [Birthday] DATE NULL, 
    [Address] NVARCHAR(50) NULL, 
    [Phone] NCHAR(10) NULL, 
    [Email] NVARCHAR(50) NULL, 
    [Sex] NCHAR(10) NULL, 
    CONSTRAINT [CK_Employee] CHECK (Salary>0), 
)

GO


CREATE UNIQUE INDEX Salary_index ON Employee(Salary);

