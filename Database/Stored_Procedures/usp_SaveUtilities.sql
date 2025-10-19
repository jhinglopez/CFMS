IF OBJECT_ID ('dbo.usp_SaveUtilities') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveUtilities
GO

CREATE PROCEDURE dbo.usp_SaveUtilities

	@Id NVARCHAR(128), 
	@Name NVARCHAR(256), 
	@UtilityTypeId NVARCHAR(128),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Result NVARCHAR(500) = ''

IF @Id = '0'
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblUtilities WHERE Name = @Name)
			BEGIN 
				SET @Id = NEWID()
				--
				INSERT INTO dbo.tblUtilities (Id, Name, UtilityTypeId, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
				VALUES (@Id, @Name, @UtilityTypeId, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END
ELSE
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblUtilities WHERE Name = @Name AND Id != @Id)
			BEGIN 
				UPDATE	dbo.tblUtilities
				SET 	Name = @Name,
						UtilityTypeId = @UtilityTypeId
				WHERE 	Id = @Id
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END 

SELECT @Result AS 'Result'
GO

