CREATE TABLE [dbo].[Contract]
(
	[Contract_id] INT NOT NULL PRIMARY KEY, 
    [Employee_id] INT NOT NULL, 
    [Project_id] INT NOT NULL, 
    [Start_date] DATE NULL, 
    [End_date] DATE NULL, 
    CONSTRAINT [FK_Contract_ToContract_worker] FOREIGN KEY ([Employee_id]) REFERENCES [Contract_worker]([Employee_id]), 
    CONSTRAINT [FK_Contract_To_Project] FOREIGN KEY (Project_id) REFERENCES [Project]([Project_id])
)
