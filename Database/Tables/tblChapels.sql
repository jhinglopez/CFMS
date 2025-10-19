IF OBJECT_ID ('dbo.tblChapels') IS NOT NULL
	DROP TABLE dbo.tblChapels
GO

CREATE TABLE dbo.tblChapels
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblChapels PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblChapels_1
	ON dbo.tblChapels (Name)
GO

