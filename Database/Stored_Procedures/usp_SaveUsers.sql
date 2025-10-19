IF OBJECT_ID ('dbo.usp_SaveUsers') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveUsers
GO

CREATE PROCEDURE dbo.usp_SaveUsers

	@ChapelId NVARCHAR(128),
	@UserName NVARCHAR(128),
	@FullName NVARCHAR(256),
	@RoleId NVARCHAR(128),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Id NVARCHAR(128) = (SELECT Id FROM dbo.AspNetUsers WHERE UserName = @UserName)

UPDATE	dbo.AspNetUsers
SET		ChapelId = @ChapelId,
		FullName = @FullName,
		AuditCreateDate = GETDATE(),
		AuditCreateUser = @AuditUser,
		AuditUpdateDate = GETDATE(),
		AuditUpdateUser = @AuditUser
WHERE	Id = @Id

DELETE FROM dbo.AspNetUserRoles WHERE UserId = @Id
INSERT INTO dbo.AspNetUserRoles (UserId, RoleId)
SELECT @Id, @RoleId
GO

