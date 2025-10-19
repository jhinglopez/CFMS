IF OBJECT_ID ('dbo.usp_DeleteRoles') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteRoles
GO

CREATE PROCEDURE dbo.usp_DeleteRoles

	@Id NVARCHAR(128)
	
AS
SET NOCOUNT ON 

DECLARE @Result NVARCHAR(500) = ''

IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles WHERE RoleId = @Id)
	BEGIN	
		DELETE FROM dbo.AspNetRoles WHERE Id = @Id
		DELETE FROM dbo.AspNetRolePageAccess WHERE RoleId = @Id
	END 
ELSE
	BEGIN 
		SET @Result = 'Delete failed. Role is still being use.'
	END 

SELECT @Result AS 'Result'
GO

