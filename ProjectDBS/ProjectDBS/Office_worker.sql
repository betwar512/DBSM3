CREATE TABLE [dbo].[Office_worker]
(
	[Employee_Id] INT NOT NULL PRIMARY KEY, 
    [Department_Id] INT NULL, 
    [Super_Id] NCHAR(10) NULL, 
    CONSTRAINT [FK_Office_worker_ToEmployee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Employee_Id]), 
    CONSTRAINT [FK_Office_worker_ToDepartment] FOREIGN KEY ([Department_id]) REFERENCES [Department]([Department_id])
)
