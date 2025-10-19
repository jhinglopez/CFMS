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

