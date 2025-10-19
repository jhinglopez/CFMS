IF OBJECT_ID ('dbo.AspNetRolePageAccess') IS NOT NULL
	DROP TABLE dbo.AspNetRolePageAccess
GO

CREATE TABLE dbo.AspNetRolePageAccess
	(
	RoleId NVARCHAR (128) NOT NULL,
	PageId NVARCHAR (128) NOT NULL
	)
GO

CREATE INDEX IX_AspNetRolePageAccess_RoleId
	ON dbo.AspNetRolePageAccess (RoleId)
GO

CREATE INDEX IX_AspNetRolePageAccess_PageId
	ON dbo.AspNetRolePageAccess (PageId)
GO

