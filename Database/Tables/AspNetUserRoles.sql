IF OBJECT_ID ('dbo.AspNetUserRoles') IS NOT NULL
	DROP TABLE dbo.AspNetUserRoles
GO

CREATE TABLE dbo.AspNetUserRoles
	(
	UserId NVARCHAR (128) NOT NULL,
	RoleId NVARCHAR (128) NOT NULL,
	CONSTRAINT PK_AspNetUserRoles PRIMARY KEY (UserId, RoleId)
	)
GO

CREATE INDEX IX_AspNetUserRoles_UserId
	ON dbo.AspNetUserRoles (UserId)
GO

CREATE INDEX IX_AspNetUserRoles_RoleId
	ON dbo.AspNetUserRoles (RoleId)
GO

