IF OBJECT_ID ('dbo.usp_GetUtilityType') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilityType
GO

CREATE PROCEDURE dbo.usp_GetUtilityType

AS
SET NOCOUNT ON 

SELECT 		Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 		dbo.tblUtilityType
ORDER BY 	Name
GO

