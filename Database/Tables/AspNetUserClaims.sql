IF OBJECT_ID ('dbo.AspNetUserClaims') IS NOT NULL
	DROP TABLE dbo.AspNetUserClaims
GO

CREATE TABLE dbo.AspNetUserClaims
	(
	Id         INT IDENTITY NOT NULL,
	UserId     NVARCHAR (128) NOT NULL,
	ClaimType  NVARCHAR (max),
	ClaimValue NVARCHAR (max),
	CONSTRAINT PK_AspNetUserClaims PRIMARY KEY (Id)
	)
GO

