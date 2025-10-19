IF OBJECT_ID ('dbo.AspNetRoles') IS NOT NULL
	DROP TABLE dbo.AspNetRoles
GO

CREATE TABLE dbo.AspNetRoles
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256) NOT NULL,
	Description     NVARCHAR (256),
	IsActive        BIT,
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_AspNetRoles PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_AspNetRoles_1
	ON dbo.AspNetRoles (Name)
GO

