CREATE TABLE [dbo].[Contract_worker]
(
	[Employee_id] INT NOT NULL PRIMARY KEY, 
    [Specialization] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_Contract_worker_ToTable] FOREIGN KEY ([Employee_id]) REFERENCES [Employee]([Employee_id]) 
)

GO

CREATE TRIGGER dbo.Trigger_Contract_worker_id
    ON dbo.Contract_worker
    FOR  INSERT
    AS
    BEGIN
		IF (SELECT COUNT(*) FROM Office_worker O WHERE O.Employee_Id=Employee_Id)!=0
		raiserror('Oh no a fatal error', 20, -1)
	
    END

GO 

CREATE UNIQUE INDEX Contract_Id_index ON dbo.Contract_Worker(Employee_Id);
