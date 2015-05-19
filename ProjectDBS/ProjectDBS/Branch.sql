CREATE TABLE [dbo].[Branch]
(
	[Company_id] INT NOT NULL , 
    [Name] NCHAR(10) NOT NULL, 
    [Phone] NCHAR(10) NOT NULL, 
    [Address] NVARCHAR(50) NOT NULL, 
    [Email] NCHAR(10) NOT NULL, 
    CONSTRAINT [FK_Branch_To_Company] FOREIGN KEY ([Company_id]) REFERENCES [Company]([Company_id]), 
    PRIMARY KEY ([Company_id], [Name])
)
