IF OBJECT_ID ('dbo.usp_GetUsers') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUsers
GO

CREATE PROCEDURE dbo.usp_GetUsers
	
AS
SET NOCOUNT ON 

SELECT 		a.Id, 
			a.Email, 
			a.UserName, 
			a.FullName,
			a.SecuritySignum,
			a.AuditCreateDate, 
			a.AuditCreateUser, 
			a.AuditUpdateDate, 
			a.AuditUpdateUser, 
			ISNULL(b.RoleId,'') AS 'RoleId', 
			ISNULL(c.Name,'') AS 'RoleName'
FROM 		dbo.AspNetUsers a
LEFT JOIN 	dbo.AspNetUserRoles b ON a.Id = b.UserId
LEFT JOIN 	dbo.AspNetRoles c ON b.RoleId = c.Id
ORDER BY 	a.UserName
GO

