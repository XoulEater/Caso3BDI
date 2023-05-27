USE [esencialVerde]
GO
/****** Object:  StoredProcedure [dbo].[generateTransaction]    Script Date: 26/5/2023 8:06:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[generateTransactionRB]
    @TVP transactionData READONLY,
	@transactionTypeID SMALLINT,
	@referenceID BIGINT
AS 
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here (yo confio en Rodrigo )
		INSERT INTO [dbo].[transactionLogs]
				   ([transactionTypeID],[referenceID],[monto],[posttime],[actorID],[discount],[monedaID],
				   [createdAt],[computer],[username])
		SELECT @transactionTypeID, @referenceID, monto, posttime, actorID, discount, monedaID, posttime, 'computer1', 'user1'
		FROM @TVP

		WAITFOR DELAY '00:00:15'
-- DELIMITER		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK 
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
RETURN 0
GO

DECLARE @tvp [transactionData]
INSERT INTO @tvp
VALUES (1, 10000, GETDATE(), 1, 0)
EXEC generateTransactionRB @tvp, 1, 1