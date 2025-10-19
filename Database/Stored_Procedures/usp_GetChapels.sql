IF OBJECT_ID ('dbo.usp_GetChapels') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetChapels
GO

CREATE PROCEDURE dbo.usp_GetChapels

AS
SET NOCOUNT ON 

SELECT 		Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 		dbo.tblChapels
ORDER BY 	Name
GO

