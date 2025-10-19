IF OBJECT_ID ('dbo.usp_GetRolesById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetRolesById
GO

CREATE PROCEDURE dbo.usp_GetRolesById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, Description, IsActive, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.AspNetRoles
WHERE 	Id = @Id
GO

