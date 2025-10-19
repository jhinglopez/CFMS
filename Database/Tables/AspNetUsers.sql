IF OBJECT_ID ('dbo.AspNetUsers') IS NOT NULL
	DROP TABLE dbo.AspNetUsers
GO

CREATE TABLE dbo.AspNetUsers
	(
	Id                   NVARCHAR (128) NOT NULL,
	ChapelId             NVARCHAR (128),
	Email                NVARCHAR (256),
	EmailConfirmed       BIT NOT NULL,
	PasswordHash         NVARCHAR (max),
	SecurityStamp        NVARCHAR (max),
	PhoneNumber          NVARCHAR (max),
	PhoneNumberConfirmed BIT NOT NULL,
	TwoFactorEnabled     BIT NOT NULL,
	LockoutEndDateUtc    DATETIME,
	LockoutEnabled       BIT NOT NULL,
	AccessFailedCount    INT NOT NULL,
	UserName             NVARCHAR (256) NOT NULL,
	FullName             NVARCHAR (256),
	SecuritySignum       NVARCHAR (4000),
	IsActive             BIT,
	Company              NVARCHAR (400),
	CountryCode          NVARCHAR (2),
	AuditCreateDate      DATETIME,
	AuditCreateUser      NVARCHAR (256),
	AuditUpdateDate      DATETIME,
	AuditUpdateUser      NVARCHAR (256),
	CONSTRAINT PK_AspNetUsers PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_AspNetUsers_UserName
	ON dbo.AspNetUsers (UserName)
GO

