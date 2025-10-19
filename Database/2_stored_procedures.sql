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

IF OBJECT_ID ('dbo.usp_SaveUtilityType') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveUtilityType
GO

CREATE PROCEDURE dbo.usp_SaveUtilityType

	@Id NVARCHAR(128), 
	@Name NVARCHAR(256),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Result NVARCHAR(500) = ''

IF @Id = '0'
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblUtilityType WHERE Name = @Name)
			BEGIN 
				SET @Id = NEWID()
				--
				INSERT INTO dbo.tblUtilityType (Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
				VALUES (@Id, @Name, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
			END 
		ELSE
			BEGIN 
				SET @Result = 'Save failed. Name already exists.'
			END 
	END 
ELSE
	BEGIN 
		IF NOT EXISTS (SELECT 1 FROM dbo.tblUtilityType WHERE Name = @Name AND Id != @Id)
			BEGIN 
				UPDATE	dbo.tblUtilityType
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

IF OBJECT_ID ('dbo.usp_GetUtilityTypeById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilityTypeById
GO

CREATE PROCEDURE dbo.usp_GetUtilityTypeById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblUtilityType
WHERE 	Id = @Id
GO

IF OBJECT_ID ('dbo.usp_GetUtilityType') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilityType
GO

CREATE PROCEDURE dbo.usp_GetUtilityType

AS
SET NOCOUNT ON 

SELECT 		Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 		dbo.tblUtilityType
ORDER BY 	Name
GO

IF OBJECT_ID ('dbo.usp_GetUtilitiesById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilitiesById
GO

CREATE PROCEDURE dbo.usp_GetUtilitiesById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, UtilityTypeId, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblUtilities
WHERE	Id = @Id
GO

IF OBJECT_ID ('dbo.usp_GetUtilities') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUtilities
GO

CREATE PROCEDURE dbo.usp_GetUtilities

AS
SET NOCOUNT ON 

SELECT 		a.Id, a.Name, a.UtilityTypeId, b.Name AS 'UtilityType', a.AuditCreateDate, a.AuditCreateUser, a.AuditUpdateDate, a.AuditUpdateUser
FROM 		dbo.tblUtilities a
LEFT JOIN 	dbo.tblUtilityType b ON a.UtilityTypeId = b.Id
ORDER BY	Name
GO

IF OBJECT_ID ('dbo.usp_GetUsersById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUsersById
GO

CREATE PROCEDURE dbo.usp_GetUsersById

	@ChapelId NVARCHAR(128),
	@Id NVARCHAR(256)

AS
SET NOCOUNT ON 

SELECT 		a.Id, 
			a.Email, 
			a.UserName, 
			a.FullName, 
			a.AuditCreateDate, 
			a.AuditCreateUser, 
			a.AuditUpdateDate, 
			a.AuditUpdateUser,
			ISNULL(b.RoleId,'') AS 'RoleId'
FROM 		dbo.AspNetUsers a
LEFT JOIN 	dbo.AspNetUserRoles b ON a.Id = b.UserId
WHERE 		a.Id = @Id
AND 		a.ChapelId = @ChapelId
GO

IF OBJECT_ID ('dbo.usp_GetUsers') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetUsers
GO

CREATE PROCEDURE dbo.usp_GetUsers

	@ChapelId NVARCHAR(128)
	
AS
SET NOCOUNT ON 

SELECT 		a.Id, 
			a.Email, 
			a.UserName, 
			a.FullName, 
			a.AuditCreateDate, 
			a.AuditCreateUser, 
			a.AuditUpdateDate, 
			a.AuditUpdateUser, 
			ISNULL(b.RoleId,'') AS 'RoleId', 
			ISNULL(c.Name,'') AS 'RoleName'
FROM 		dbo.AspNetUsers a
LEFT JOIN 	dbo.AspNetUserRoles b ON a.Id = b.UserId
LEFT JOIN 	dbo.AspNetRoles c ON b.RoleId = c.Id
WHERE 		a.ChapelId = @ChapelId
ORDER BY 	a.UserName
GO

IF OBJECT_ID ('dbo.usp_GetRolesById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetRolesById
GO

CREATE PROCEDURE dbo.usp_GetRolesById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, Description, IsActive, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.AspNetRoles
WHERE 	Id = @Id
GO

IF OBJECT_ID ('dbo.usp_GetRoles') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetRoles
GO

CREATE PROCEDURE dbo.usp_GetRoles

AS
SET NOCOUNT ON 

SELECT 		Id, Name, Description, IsActive, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 		dbo.AspNetRoles
ORDER BY 	Name
GO

IF OBJECT_ID ('dbo.usp_GetPagesByRoleId') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetPagesByRoleId
GO

CREATE PROCEDURE dbo.usp_GetPagesByRoleId

		@RoleId NVARCHAR(128)

AS
SET NOCOUNT ON 

DECLARE @RoleIdAdmin NVARCHAR(128) = (SELECT TOP 1 Id FROM dbo.AspNetRoles WHERE Name = 'Admin')

SELECT PageId INTO #Pages FROM dbo.AspNetRolePageAccess WHERE RoleId = @RoleId

IF @RoleId = @RoleIdAdmin
	BEGIN 
		SELECT 		a.Id
					,a.PagePath
					,a.PageDescription
					,CAST(1 AS BIT) 'IsWithAccess'
		FROM		dbo.AspNetPages a	
		ORDER BY	a.PageDescription
	END 
ELSE
	BEGIN 
		SELECT 		a.Id
					,a.PagePath
					,a.PageDescription
					,CAST(CASE COALESCE(b.PageId, '0') WHEN '0' THEN 0 ELSE 1 END AS BIT) AS 'IsWithAccess'
		FROM		dbo.AspNetPages a
		LEFT JOIN	#Pages b
		ON			a.Id = b.PageId	   	
		ORDER BY	a.PageDescription
	END
GO

IF OBJECT_ID ('dbo.usp_GetChapelsById') IS NOT NULL
	DROP PROCEDURE dbo.usp_GetChapelsById
GO

CREATE PROCEDURE dbo.usp_GetChapelsById

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

SELECT 	Id, Name, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser
FROM 	dbo.tblChapels
WHERE 	Id = @Id
GO

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

IF OBJECT_ID ('dbo.usp_DeleteUtilityType') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteUtilityType
GO

CREATE PROCEDURE dbo.usp_DeleteUtilityType

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON

DELETE FROM dbo.tblUtilityType WHERE Id = @Id
GO

IF OBJECT_ID ('dbo.usp_DeleteUtilities') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteUtilities
GO

CREATE PROCEDURE dbo.usp_DeleteUtilities

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

DELETE FROM dbo.tblUtilities WHERE Id = @Id
GO

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

IF OBJECT_ID ('dbo.usp_DeleteRoles') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteRoles
GO

CREATE PROCEDURE dbo.usp_DeleteRoles

	@Id NVARCHAR(128)
	
AS
SET NOCOUNT ON 

DECLARE @Result NVARCHAR(500) = ''

IF NOT EXISTS (SELECT 1 FROM dbo.AspNetUserRoles WHERE RoleId = @Id)
	BEGIN	
		DELETE FROM dbo.AspNetRoles WHERE Id = @Id
		DELETE FROM dbo.AspNetRolePageAccess WHERE RoleId = @Id
	END 
ELSE
	BEGIN 
		SET @Result = 'Delete failed. Role is still being use.'
	END 

SELECT @Result AS 'Result'
GO

IF OBJECT_ID ('dbo.usp_DeleteChapels') IS NOT NULL
	DROP PROCEDURE dbo.usp_DeleteChapels
GO

CREATE PROCEDURE dbo.usp_DeleteChapels

	@Id NVARCHAR(128)

AS
SET NOCOUNT ON 

DELETE FROM dbo.tblChapels WHERE Id = @Id
GO

