IF OBJECT_ID ('dbo.tblUtilityType') IS NOT NULL
	DROP TABLE dbo.tblUtilityType
GO

CREATE TABLE dbo.tblUtilityType
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblUtilityType PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblUtilityType_1
	ON dbo.tblUtilityType (Name)
GO

