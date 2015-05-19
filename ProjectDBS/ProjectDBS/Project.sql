CREATE TABLE [dbo].[Project]
(
	[Project_id] INT NOT NULL PRIMARY KEY, 
    [Company_id] INT NULL, 
    [Project_name] NCHAR(10) NULL, 
    CONSTRAINT [FK_Project_ToCompany] FOREIGN KEY ([Company_id]) REFERENCES [Company]([Company_id])
)
