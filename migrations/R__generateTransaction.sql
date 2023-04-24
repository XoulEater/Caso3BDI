CREATE TYPE transactionData 
   AS TABLE
      (actorID INT, 
	  monto MONEY,
	  posttime DATETIME,
	  monedaID INT);
GO

-- Ejemplo profe
CREATE PROCEDURE generateTransaction
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
		SELECT @transactionTypeID, @referenceID, CASE WHEN @transactionTypeID = 2 THEN monto ELSE monto END as montoCalc, posttime, actorID, 0, monedaID, posttime, 'computer1', 'user1'
		FROM @TVP
				   

-- DELIMITER		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
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