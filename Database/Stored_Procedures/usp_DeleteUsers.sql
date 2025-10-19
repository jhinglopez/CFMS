IF OBJECT_ID ('dbo.usp_DeleteUsers') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteUsers
GO

CREATE PROCEDURE dbo.usp_DeleteUsers

	@ChapelId NVARCHAR(128),
	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

DELETE FROM dbo.AspNetUsers WHERE Id = @Id AND ChapelId = @ChapelId
DELETE FROM dbo.AspNetUserRoles WHERE UserId = @Id
GO

