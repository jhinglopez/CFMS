IF OBJECT_ID ('dbo.tblUtilityType') IS NOT NULL
	DROP TABLE dbo.tblUtilityType
GO

CREATE TABLE dbo.tblUtilityType
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblUtilityType PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblUtilityType_1
	ON dbo.tblUtilityType (Name)
GO

IF OBJECT_ID ('dbo.tblUtilities') IS NOT NULL
	DROP TABLE dbo.tblUtilities
GO

CREATE TABLE dbo.tblUtilities
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	UtilityTypeId   NVARCHAR (128),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblUtilities PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblUtilities_1
	ON dbo.tblUtilities (Name)
GO

IF OBJECT_ID ('dbo.tblForwardings') IS NOT NULL
	DROP TABLE dbo.tblForwardings
GO

CREATE TABLE dbo.tblForwardings
	(
	Id              NVARCHAR (128) NOT NULL,
	ChapelId        NVARCHAR (128),
	TranType        NVARCHAR (256),
	TranDate        DATETIME,
	Name            NVARCHAR (256),
	Amount          DECIMAL (18, 2),
	VentureTitle    NVARCHAR (256),
	Beneficiary     NVARCHAR (max),
	ApprovalUserId  NVARCHAR (128),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblForwardings PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblForwardings_1
	ON dbo.tblForwardings (ChapelId, TranType)
GO

CREATE INDEX IX_tblForwardings_2
	ON dbo.tblForwardings (ChapelId, TranDate)
GO

CREATE INDEX IX_tblForwardings_3
	ON dbo.tblForwardings (ChapelId, Name)
GO

CREATE INDEX IX_tblForwardings_4
	ON dbo.tblForwardings (ChapelId, TranType, TranDate)
GO

IF OBJECT_ID ('dbo.tblChapels') IS NOT NULL
	DROP TABLE dbo.tblChapels
GO

CREATE TABLE dbo.tblChapels
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblChapels PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblChapels_1
	ON dbo.tblChapels (Name)
GO

IF OBJECT_ID ('dbo.tblCashOutflows') IS NOT NULL
	DROP TABLE dbo.tblCashOutflows
GO

CREATE TABLE dbo.tblCashOutflows
	(
	Id              NVARCHAR (128) NOT NULL,
	ChapelId        NVARCHAR (128),
	TranType        NVARCHAR (256),
	TranDate        DATETIME,
	Name            NVARCHAR (256),
	ReferenceTitle  NVARCHAR (256),
	Amount          DECIMAL (18, 2),
	ItemName        NVARCHAR (256),
	ApprovalUserId  NVARCHAR (128),
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_tblCashOutflows PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblCashOutflows_1
	ON dbo.tblCashOutflows (ChapelId, TranType)
GO

CREATE INDEX IX_tblCashOutflows_2
	ON dbo.tblCashOutflows (ChapelId, TranDate)
GO

CREATE INDEX IX_tblCashOutflows_3
	ON dbo.tblCashOutflows (ChapelId, Name)
GO

CREATE INDEX IX_tblCashOutflows_4
	ON dbo.tblCashOutflows (ChapelId, TranType, TranDate)
GO

IF OBJECT_ID ('dbo.tblCashInflows') IS NOT NULL
	DROP TABLE dbo.tblCashInflows
GO

CREATE TABLE dbo.tblCashInflows
	(
	Id                     NVARCHAR (128) NOT NULL,
	ChapelId               NVARCHAR (128),
	TranType               NVARCHAR (256),
	TranDate               DATETIME,
	Name                   NVARCHAR (256),
	ReferenceTitle         NVARCHAR (256),
	Amount                 DECIMAL (18, 2),
	ProjectTitle           NVARCHAR (256),
	AcknowledgementReceipt NVARCHAR (256),
	AuditCreateDate        DATETIME,
	AuditCreateUser        NVARCHAR (256),
	AuditUpdateDate        DATETIME,
	AuditUpdateUser        NVARCHAR (256),
	CONSTRAINT PK_tblCashInflows PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_tblCashInflows_1
	ON dbo.tblCashInflows (ChapelId, TranType)
GO

CREATE INDEX IX_tblCashInflows_2
	ON dbo.tblCashInflows (ChapelId, TranDate)
GO

CREATE INDEX IX_tblCashInflows_3
	ON dbo.tblCashInflows (ChapelId, Name)
GO

CREATE INDEX IX_tblCashInflows_4
	ON dbo.tblCashInflows (ChapelId, TranType, TranDate)
GO

IF OBJECT_ID ('dbo.AspNetUsers') IS NOT NULL
	DROP TABLE dbo.AspNetUsers
GO

CREATE TABLE dbo.AspNetUsers
	(
	Id                   NVARCHAR (128) NOT NULL,
	ChapelId             NVARCHAR (128),
	Email                NVARCHAR (256),
	EmailConfirmed       BIT NOT NULL,
	PasswordHash         NVARCHAR (max),
	SecurityStamp        NVARCHAR (max),
	PhoneNumber          NVARCHAR (max),
	PhoneNumberConfirmed BIT NOT NULL,
	TwoFactorEnabled     BIT NOT NULL,
	LockoutEndDateUtc    DATETIME,
	LockoutEnabled       BIT NOT NULL,
	AccessFailedCount    INT NOT NULL,
	UserName             NVARCHAR (256) NOT NULL,
	FullName             NVARCHAR (256),
	SecuritySignum       NVARCHAR (4000),
	IsActive             BIT,
	Company              NVARCHAR (400),
	CountryCode          NVARCHAR (2),
	AuditCreateDate      DATETIME,
	AuditCreateUser      NVARCHAR (256),
	AuditUpdateDate      DATETIME,
	AuditUpdateUser      NVARCHAR (256),
	CONSTRAINT PK_AspNetUsers PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_AspNetUsers_UserName
	ON dbo.AspNetUsers (UserName)
GO

IF OBJECT_ID ('dbo.AspNetUserRoles') IS NOT NULL
	DROP TABLE dbo.AspNetUserRoles
GO

CREATE TABLE dbo.AspNetUserRoles
	(
	UserId NVARCHAR (128) NOT NULL,
	RoleId NVARCHAR (128) NOT NULL,
	CONSTRAINT PK_AspNetUserRoles PRIMARY KEY (UserId, RoleId)
	)
GO

CREATE INDEX IX_AspNetUserRoles_UserId
	ON dbo.AspNetUserRoles (UserId)
GO

CREATE INDEX IX_AspNetUserRoles_RoleId
	ON dbo.AspNetUserRoles (RoleId)
GO

IF OBJECT_ID ('dbo.AspNetUserLogins') IS NOT NULL
	DROP TABLE dbo.AspNetUserLogins
GO

CREATE TABLE dbo.AspNetUserLogins
	(
	LoginProvider NVARCHAR (128) NOT NULL,
	ProviderKey   NVARCHAR (128) NOT NULL,
	UserId        NVARCHAR (128) NOT NULL,
	CONSTRAINT PK_AspNetUserLogins PRIMARY KEY (LoginProvider, ProviderKey, UserId)
	)
GO

IF OBJECT_ID ('dbo.AspNetUserClaims') IS NOT NULL
	DROP TABLE dbo.AspNetUserClaims
GO

CREATE TABLE dbo.AspNetUserClaims
	(
	Id         INT IDENTITY NOT NULL,
	UserId     NVARCHAR (128) NOT NULL,
	ClaimType  NVARCHAR (max),
	ClaimValue NVARCHAR (max),
	CONSTRAINT PK_AspNetUserClaims PRIMARY KEY (Id)
	)
GO

IF OBJECT_ID ('dbo.AspNetRoles') IS NOT NULL
	DROP TABLE dbo.AspNetRoles
GO

CREATE TABLE dbo.AspNetRoles
	(
	Id              NVARCHAR (128) NOT NULL,
	Name            NVARCHAR (256) NOT NULL,
	Description     NVARCHAR (256),
	IsActive        BIT,
	AuditCreateDate DATETIME,
	AuditCreateUser NVARCHAR (256),
	AuditUpdateDate DATETIME,
	AuditUpdateUser NVARCHAR (256),
	CONSTRAINT PK_AspNetRoles PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_AspNetRoles_1
	ON dbo.AspNetRoles (Name)
GO

IF OBJECT_ID ('dbo.AspNetRolePageAccess') IS NOT NULL
	DROP TABLE dbo.AspNetRolePageAccess
GO

CREATE TABLE dbo.AspNetRolePageAccess
	(
	RoleId NVARCHAR (128) NOT NULL,
	PageId NVARCHAR (128) NOT NULL
	)
GO

CREATE INDEX IX_AspNetRolePageAccess_RoleId
	ON dbo.AspNetRolePageAccess (RoleId)
GO

CREATE INDEX IX_AspNetRolePageAccess_PageId
	ON dbo.AspNetRolePageAccess (PageId)
GO

IF OBJECT_ID ('dbo.AspNetPages') IS NOT NULL
	DROP TABLE dbo.AspNetPages
GO

CREATE TABLE dbo.AspNetPages
	(
	Id              NVARCHAR (128) NOT NULL,
	PagePath        NVARCHAR (256) NOT NULL,
	Folder          NVARCHAR (256) NOT NULL,
	PageDescription NVARCHAR (256) NOT NULL,
	SortId          INT,
	IsActive        BIT,
	CONSTRAINT PK_AspNetPages PRIMARY KEY (Id)
	)
GO

CREATE INDEX IX_AspNetPages_PagePath
	ON dbo.AspNetPages (PagePath)
GO

CREATE INDEX IX_AspNetPages_SortId
	ON dbo.AspNetPages (SortId)
GO

