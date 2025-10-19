IF OBJECT_ID ('dbo.usp_GetRoles') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetRoles
GO

CREATE PROCEDURE dbo.usp_GetRoles

AS
SET NOCOUNT ON 

SELECT 		Id, Name, Description, IsActive, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 		dbo.AspNetRoles
ORDER BY 	Name
GO

