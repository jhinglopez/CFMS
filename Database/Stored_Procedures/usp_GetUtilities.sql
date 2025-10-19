IF OBJECT_ID ('dbo.usp_GetUtilities') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilities
GO

CREATE PROCEDURE dbo.usp_GetUtilities

AS
SET NOCOUNT ON 

SELECT 		a.Id, a.Name, a.UtilityTypeId, b.Name AS 'UtilityType', a.AuditCreateDate, a.AuditCreateUser, a.AuditUpdateDate, a.AuditUpdateUser
FROM 		dbo.tblUtilities a
LEFT JOIN 	dbo.tblUtilityType b ON a.UtilityTypeId = b.Id
ORDER BY	Name
GO

