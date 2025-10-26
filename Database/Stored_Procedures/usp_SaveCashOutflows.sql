IF OBJECT_ID ('dbo.usp_SaveCashOutflows') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveCashOutflows
GO

CREATE PROCEDURE dbo.usp_SaveCashOutflows

	@ChapelId NVARCHAR(128), 
	@TranType NVARCHAR(256), 
	@Category NVARCHAR(256), 
	@TranDate DATETIME, 
	@Name NVARCHAR(256), 
	@ReferenceTitle NVARCHAR(256), 
	@Amount DECIMAL(18,2), 
	@ItemName NVARCHAR(256), 
	@ApprovalUserId NVARCHAR(128),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Id NVARCHAR(128) = NEWID()

INSERT INTO dbo.tblCashOutflows
	(Id, ChapelId, TranType, Category, TranDate, Name, ReferenceTitle, Amount, ItemName, ApprovalUserId, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
VALUES 
	(@Id, @ChapelId, @TranType, @Category, @TranDate, @Name, @ReferenceTitle, @Amount, @ItemName, @ApprovalUserId, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
GO

