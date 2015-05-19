CREATE TABLE [dbo].[Contract_task]
(
	[Contract_id] INT NOT NULL , 
    [Task_name] NCHAR(10) NOT NULL, 
    [Task_description] NVARCHAR(50) NULL, 
    PRIMARY KEY ([Contract_id], [Task_name]), 
    CONSTRAINT [FK_Contract_task_ToContract] FOREIGN KEY ([Contract_id]) REFERENCES [Contract]([Contract_id])
)
