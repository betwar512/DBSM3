CREATE TABLE [dbo].[Project_status_report]
(
	[Project_id] INT NOT NULL , 
    [Registration] NCHAR(10) NOT NULL, 
    [Employee_id] INT NULL, 
    [Work_hours] NCHAR(10) NULL, 
    [Description] NVARCHAR(50) NULL, 
    [Role] NCHAR(10) NULL, 
    [Project_status] NCHAR(10) NULL, 
    CONSTRAINT FK_Project_status_report_ToContract_worker FOREIGN KEY (Employee_id) REFERENCES Contract_worker(Employee_id), 
    CONSTRAINT FK_Project_status_report_ToProject FOREIGN KEY (Project_id) REFERENCES Project(Project_id), 
    PRIMARY KEY (Project_id, Registration)
)
