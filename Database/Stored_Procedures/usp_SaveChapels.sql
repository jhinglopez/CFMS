IF OBJECT_ID ('dbo.usp_SaveChapels') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveChapels
GO

CREATE PROCEDURE dbo.usp_SaveChapels

	@Id NVARCHAR(128), 
	@Name NVARCHAR(256),
	@AuditUser NVARCHAR(256)
	
AS
SET NOCOUNT ON

DECLARE @Result NVARCHAR(500) = ''

IF @Id = '0'
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblChapels WHERE Name = @Name)
			BEGIN 
				SET @Id = NEWID()
				--
				INSERT INTO dbo.tblChapels (Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
				VALUES (@Id, @Name, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
			END  
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END 
ELSE
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblChapels WHERE Name = @Name AND Id != @Id)
			BEGIN 
				UPDATE	dbo.tblChapels
				SET 	Name = @Name,
						AuditUpdateDate = GETDATE(),
						AuditUpdateUser = @AuditUser
				WHERE 	Id = @Id
			END  
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END 

SELECT @Result AS 'Result'
GO

