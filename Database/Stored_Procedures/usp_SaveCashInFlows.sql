IF OBJECT_ID ('dbo.usp_SaveCashInFlows') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveCashInFlows
GO

CREATE PROCEDURE dbo.usp_SaveCashInFlows

	@ChapelId NVARCHAR(128), 
	@TranType NVARCHAR(256), 
	@TranDate DATETIME, 
	@Name NVARCHAR(256), 
	@ReferenceTitle NVARCHAR(256), 
	@Amount DECIMAL(18,2), 
	@AcknowledgementReceipt NVARCHAR(256),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Id NVARCHAR(128) = NEWID()

INSERT INTO dbo.tblCashInflows 
	(Id, ChapelId, TranType, TranDate, Name, ReferenceTitle, Amount, AcknowledgementReceipt, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
VALUES 
	(@Id, @ChapelId, @TranType, @TranDate, @Name, @ReferenceTitle, @Amount, @AcknowledgementReceipt, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
GO

