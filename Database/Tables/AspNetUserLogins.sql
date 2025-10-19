IF OBJECT_ID ('dbo.AspNetUserLogins') IS NOT NULL
	DROP TABLE dbo.AspNetUserLogins
GO

CREATE TABLE dbo.AspNetUserLogins
	(
	LoginProvider NVARCHAR (128) NOT NULL,
	ProviderKey   NVARCHAR (128) NOT NULL,
	UserId        NVARCHAR (128) NOT NULL,
	CONSTRAINT PK_AspNetUserLogins PRIMARY KEY (LoginProvider, ProviderKey, UserId)
	)
GO

