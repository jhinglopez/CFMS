IF OBJECT_ID ('dbo.usp_DeleteUtilities') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteUtilities
GO

CREATE PROCEDURE dbo.usp_DeleteUtilities

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

DELETE FROM dbo.tblUtilities WHERE Id = @Id
GO

