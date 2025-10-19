IF OBJECT_ID ('dbo.usp_UpdateUsers') IS NOT NULL
	DROP PROCEDURE dbo.usp_UpdateUsers
GO

CREATE PROCEDURE dbo.usp_UpdateUsers

	@ChapelId NVARCHAR(128),
	@Id NVARCHAR(128),
	@UserName NVARCHAR(128),
	@FullName NVARCHAR(256),
	@Email NVARCHAR(256),
	@RoleId NVARCHAR(128),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Result NVARCHAR(500) = ''

IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE UserName = @UserName AND Id != @Id)
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUsers WHERE Email = @Email AND Id != @Id)
			BEGIN 
				UPDATE 	dbo.AspNetUsers
				SET 	UserName = @UserName,
						FullName = @FullName,
						Email = @Email
				WHERE 	Id = @Id
				AND 	ChapelId = @ChapelId
				--
				UPDATE	dbo.AspNetUserRoles
				SET 	RoleId = @RoleId
				WHERE	UserId = @Id
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Email already exists.'
			END 
	END 
ELSE
	BEGIN 
		SET @Result = 'Save failed. Username already exists.'
	END 

SELECT @Result AS 'Result'
GO

