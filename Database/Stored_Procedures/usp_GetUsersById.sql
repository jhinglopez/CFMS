IF OBJECT_ID ('dbo.usp_GetUsersById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUsersById
GO

CREATE PROCEDURE dbo.usp_GetUsersById

	@Id NVARCHAR(256)

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
			ISNULL(b.RoleId,'') AS 'RoleId'
FROM 		dbo.AspNetUsers a
LEFT JOIN 	dbo.AspNetUserRoles b ON a.Id = b.UserId
WHERE 		a.Id = @Id
GO

