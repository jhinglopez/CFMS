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

