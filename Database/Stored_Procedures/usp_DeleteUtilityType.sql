IF OBJECT_ID ('dbo.usp_DeleteUtilityType') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteUtilityType
GO

CREATE PROCEDURE dbo.usp_DeleteUtilityType

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON

DELETE FROM dbo.tblUtilityType WHERE Id = @Id
GO

