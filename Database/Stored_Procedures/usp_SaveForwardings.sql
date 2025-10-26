IF OBJECT_ID ('dbo.usp_SaveForwardings') IS NOT NULL
	DROP PROCEDURE dbo.usp_SaveForwardings
GO

CREATE PROCEDURE dbo.usp_SaveForwardings

	@ChapelId NVARCHAR(128), 
	@TranType NVARCHAR(256), 
	@TranDate DATETIME, 
	@Name NVARCHAR(256), 
	@Amount DECIMAL(18,2), 
	@VentureTitle NVARCHAR(256), 
	@Beneficiary NVARCHAR(256), 
	@ApprovalUserId NVARCHAR(128),
	@AuditUser NVARCHAR(256)

AS
SET NOCOUNT ON 

DECLARE @Id NVARCHAR(128) = NEWID()

INSERT INTO dbo.tblForwardings
	(Id, ChapelId, TranType, TranDate, Name, Amount, VentureTitle, Beneficiary, ApprovalUserId, AuditCreateDate, AuditCreateUser, AuditUpdateDate, AuditUpdateUser)
VALUES 
	(@Id, @ChapelId, @TranType, @TranDate, @Name, @Amount, @VentureTitle, @Beneficiary, @ApprovalUserId, GETDATE(), @AuditUser, GETDATE(), @AuditUser)
GO

