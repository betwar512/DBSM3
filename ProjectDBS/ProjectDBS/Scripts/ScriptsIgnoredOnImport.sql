
ALTER  PROCEDURE populateEmployee
AS
 DECLARE 
 @count INT;
 DECLARE  @FromDate date = '1965-01-01';
 DECLARE @ToDate date = '1996-12-31';
 DECLARE @dateNeede date;
 DECLARE @Lower int; --phone lower
 DECLARE @Upper int; --phone upper
 DECLARE @salaryMin DECIMAL;
 DECLARE @salaryMax DECIMAL;
  DECLARE @salary DECIMAL;
 DECLARE @sex char;
 DECLARE @phone INT;


 set @Lower = 41234567---- The lowest random number
 set @Upper = 49999999 ---- The highest random number
 set @salaryMin = 46000.00;
 set @salaryMax = 120000.00;
 set @sex ='M';
 SET @count =1;
 WHILE @count < 100
 BEGIN
 set  @phone= ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)   --phone random 
 set  @phone=convert(nvarchar,@phone);
 set  @dateNeede=( select dateadd(day, 
               rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)), 
               @FromDate)); --birthday random added 
 set  @salary = (SELECT @salaryMin + (@salaryMax-@salaryMin)*RAND())

  INSERT INTO Employee VALUES(@count,'name',@salary,@dateNeede,'Address',@phone,'Email',@sex);
  IF @count%2 = 0
  BEGIN
  set @sex = 'F';
  END
  ELSE
   set  @sex ='M';
   set  @count= @count + 1;


END
--BirthDay added 
--phone random added 
--sex changes for each Employee
GO

/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP 1000 [Employee_Id]
      ,[Name]
      ,[Salary]
      ,[Birthday]
      ,[Address]
      ,[Phone]
      ,[Email]
      ,[Sex]
  FROM [M2Db].[dbo].[Employee]
GO

/****** Script for SelectTopNRows command from SSMS  ******/
--DELETE TOP (10000000) from EMPLOYEE

exec populateEmployee;
GO

SELECT TOP 1000 [Employee_Id]
	,[Name]
		,[Salary]
	,[Birthday]
	,[Address]
		,[Phone]
		,[Email]
		,[Sex]
	FROM [M2Db].[dbo].[Employee]
GO

-- =============================================
-- Create Indexed ContracyWorkerView
-- =============================================
USE M2Db
GO

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

IF object_id('dbo.ContractWorkerView','view') IS NOT NULL
	DROP VIEW  dbo.ContractWorkerView;
GO

IF object_id('dbo.OfficeWorkerView','view') IS NOT NULL
	DROP VIEW  dbo.OfficeWorkerView;
GO

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IDX' AND object_id = OBJECT_ID('dbo.Employee'))
BEGIN
DROP INDEX IDX_S ON dbo.Employee;
END
GO
