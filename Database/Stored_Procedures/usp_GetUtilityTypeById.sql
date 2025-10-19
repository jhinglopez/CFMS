IF OBJECT_ID ('dbo.usp_GetUtilityTypeById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilityTypeById
GO

CREATE PROCEDURE dbo.usp_GetUtilityTypeById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblUtilityType
WHERE 	Id = @Id
GO

