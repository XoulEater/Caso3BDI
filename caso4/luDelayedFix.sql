USE [esencialVerde]
GO
/****** Object:  StoredProcedure [dbo].[registrarPagos]    Script Date: 26/5/2023 11:51:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[registrarPagos3]
    -- Add the parameters for the stored procedure here
    @desechoID INT, 
	@cantidad INT,
    @contratoID BIGINT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements
    SET NOCOUNT ON;

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE @monto MONEY
	DECLARE @participants transactionData
	DECLARE @pBalance MONEY
	DECLARE @pagoID BIGINT

	SELECT @pBalance = balance
	FROM contratos c
	INNER JOIN sedesProdu sp  ON c.sedeProduID = sp.sedeProduID
	WHERE c.contratoID = @contratoID

	SELECT @monto = SUM(pp.precio * @cantidad) 
	FROM procesos p 
	INNER JOIN preciosProce pp ON p.procesoID = pp.procesoID
	WHERE p.desechoID = @desechoID

	INSERT INTO @participants ([actorID], [monto], [posttime], [monedaID])
	SELECT cm.actorID, @monto * cm.porcentaje, GETDATE(), 1
	FROM contratos c
	INNER JOIN comisiones cm ON c.comisionID = cm.comisionID
	WHERE c.contratoID = @contratoID

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END

	BEGIN TRY
	SET @CustomError = 2001

	IF @pBalance != 0 BEGIN 
		WAITFOR DELAY '00:00:20'
		UPDATE tvp SET 
			discount = CASE WHEN balance < monto THEN balance ELSE monto END
		FROM @participants tvp
		INNER JOIN actores ac  ON tvp.actorID = ac.actorID
		INNER JOIN sedesProdu sp ON ac.referenceID = sp.sedeProduID AND ac.objectTypeID = 1
		UPDATE sp SET 
			balance = CASE WHEN monto < balance THEN balance - monto ELSE 0 END
		FROM @participants tvp
		INNER JOIN actores ac  ON tvp.actorID = ac.actorID
		INNER JOIN sedesProdu sp ON ac.referenceID = sp.sedeProduID AND ac.objectTypeID = 1
	END

	INSERT INTO [dbo].[pagosProcesamiento]
			   ([posttime],[monto],[plantaID],[contratoID],[desechoID],[cantidad],[createdAt],[computer],[username],[monedaID])
	VALUES (GETDATE(), @monto, 3, @contratoID, @desechoID, @cantidad, GETDATE(), 'computer1', 'username1', 1)
	SET @pagoID = SCOPE_IDENTITY()

	EXEC [generateTransaction] @participants, 1, @pagoID

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

EXEC [registrarPagos3] 1, 1, 3

select * from sedesProdu


update sedesProdu
set balance = 10000
