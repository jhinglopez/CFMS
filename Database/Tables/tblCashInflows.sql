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

