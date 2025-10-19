IF OBJECT_ID ('dbo.usp_DeleteChapels') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteChapels
GO

CREATE PROCEDURE dbo.usp_DeleteChapels

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

DELETE FROM dbo.tblChapels WHERE Id = @Id
GO

