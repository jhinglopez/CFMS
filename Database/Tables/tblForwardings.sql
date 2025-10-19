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

