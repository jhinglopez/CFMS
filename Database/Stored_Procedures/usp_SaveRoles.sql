IF OBJECT_ID ('dbo.usp_SaveRoles') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveRoles
GO

CREATE PROCEDURE dbo.usp_SaveRoles

	@Id NVARCHAR(128), 
	@Name NVARCHAR(256), 
	@Description NVARCHAR(256),
	@Pages NVARCHAR(MAX),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON

DECLARE @Result NVARCHAR(500) = ''

SELECT splitdata AS 'PageId' INTO #Pages FROM dbo.udf_SplitString(@Pages,',')

IF @Id = '0'
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.AspNetRoles WHERE Name = @Name)
			BEGIN 
				SET @Id = NEWID()
				--
				INSERT INTO dbo.AspNetRoles (Id, Name, Description, IsActive, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
				VALUES (@Id, @Name, @Description, 1, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
				--
				INSERT INTO dbo.AspNetRolePageAccess (RoleId, PageId)
				SELECT @Id, PageId FROM #Pages
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END 
ELSE
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.AspNetRoles WHERE Name = @Name AND Id != @Id)
			BEGIN 
				UPDATE	dbo.AspNetRoles
				SET 	Name = @Name,
						Description = @Description,
						AuditUpdateDate = GETDATE(),
						AuditUpdateUser = @AuditUser
				WHERE	Id = @Id
				--
				DELETE FROM dbo.AspNetRolePageAccess WHERE RoleId = @Id
				INSERT INTO dbo.AspNetRolePageAccess (RoleId, PageId)
				SELECT @Id, PageId FROM #Pages
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END
	END 
	
SELECT @Result AS 'Result'
GO

