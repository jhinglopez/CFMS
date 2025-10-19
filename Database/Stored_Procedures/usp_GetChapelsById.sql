IF OBJECT_ID ('dbo.usp_GetChapelsById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetChapelsById
GO

CREATE PROCEDURE dbo.usp_GetChapelsById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblChapels
WHERE 	Id = @Id
GO

