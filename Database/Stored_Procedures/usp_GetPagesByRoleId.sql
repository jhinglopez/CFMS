IF OBJECT_ID ('dbo.usp_GetPagesByRoleId') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetPagesByRoleId
GO

CREATE PROCEDURE dbo.usp_GetPagesByRoleId

		@RoleId NVARCHAR(128)

AS
SET NOCOUNT ON 

DECLARE @RoleIdAdmin NVARCHAR(128) = (SELECT TOP 1 Id FROM dbo.AspNetRoles WHERE Name = 'Admin')

SELECT PageId INTO #Pages FROM dbo.AspNetRolePageAccess WHERE RoleId = @RoleId

IF @RoleId = @RoleIdAdmin
	BEGIN 
		SELECT 		a.Id
					,a.PagePath
					,a.PageDescription
					,CAST(1 AS BIT) 'IsWithAccess'
		FROM		dbo.AspNetPages a	
		ORDER BY	a.PageDescription
	END 
ELSE
	BEGIN 
		SELECT 		a.Id
					,a.PagePath
					,a.PageDescription
					,CAST(CASE COALESCE(b.PageId, '0') WHEN '0' THEN 0 ELSE 1 END AS BIT) AS 'IsWithAccess'
		FROM		dbo.AspNetPages a
		LEFT JOIN	#Pages b
		ON			a.Id = b.PageId	   	
		ORDER BY	a.PageDescription
	END
GO

