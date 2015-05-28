
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
 set @phone=convert(nvarchar,@phone);
 set  @dateNeede=( select dateadd(day, 
               rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)), 
               @FromDate)); --birthday random added 
set @salary = (SELECT @salaryMin + (@salaryMax-@salaryMin)*RAND())

  INSERT INTO Employee VALUES(@count,'name',@salary,@dateNeede,'Address',@phone,'Email',@sex);
  IF @count%2 = 0
  BEGIN
  set @sex = 'F';
  END
  ELSE
   set @sex ='M';
set  @count= @count + 1;


END
--BirthDay added 
--phone random added 
--sex changes for each Employee

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
