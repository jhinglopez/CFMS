IF OBJECT_ID ('dbo.tblUtilities') IS NOT NULL
	DROP TABLE dbo.tblUtilities
GO

CREATE TABLE dbo.tblUtilities
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	UtilityTypeId   NVARCHAR (128),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblUtilities PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblUtilities_1
	ON dbo.tblUtilities (Name)
GO

