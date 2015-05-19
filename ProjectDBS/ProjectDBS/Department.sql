CREATE TABLE [dbo].[Department]
(
	[Department_id] INT NOT NULL PRIMARY KEY, 
    [Department_name] NCHAR(10) NOT NULL, 
    [Phone] NCHAR(10) NULL, 
    [Manager] INT NULL
)
