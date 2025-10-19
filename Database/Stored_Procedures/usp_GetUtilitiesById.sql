IF OBJECT_ID ('dbo.usp_GetUtilitiesById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilitiesById
GO

CREATE PROCEDURE dbo.usp_GetUtilitiesById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, UtilityTypeId, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblUtilities
WHERE	Id = @Id
GO

