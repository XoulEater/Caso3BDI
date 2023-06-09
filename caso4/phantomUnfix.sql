USE [esencialVerde]
GO
/****** Object:  StoredProcedure [dbo].[RepartirSponsors2]    Script Date: 26/5/2023 9:12:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[RepartirSponsors2]
	@monto MONEY, 
    @sedeProduID BIGINT
AS
BEGIN

	SET NOCOUNT ON -- no retorne metadatos

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @cantidad BIGINT 
    DECLARE @ciudadID INT = 3 
    DECLARE @estadoID INT = 2
    DECLARE @sedeProduID2 INT
    DECLARE @industriaTypeID INT


	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001;

		-- Insert statements for procedure here
		SELECT @cantidad = COUNT(*)
		FROM sedesProdu sp
		INNER JOIN addresses ad ON ad.addressID = sp.addressID
		INNER JOIN ciudades ci ON ci.ciudadID = ad.ciudadID
		INNER JOIN estados es ON es.estadoID = ci.estadoID 
		WHERE (ci.ciudadID = @ciudadID OR @ciudadID IS NULL)
		AND (es.estadoID = @estadoID OR @estadoID IS NULL)
		AND (sp.sedeProduID = @sedeProduID2 OR @sedeProduID2 IS NULL)
		AND (sp.industriaTypeID = @industriaTypeID OR @industriaTypeID IS NULL)

	
		SET @monto = @monto / @cantidad
	
		-- Si un el ingreso de un nuevo productor o bien la actualizacion de un existente es hecho en 
		-- este momento y cumple con el filtro anterior tambien recibiria una parte, el problema es 
		-- que si no es tomado en cuenta para la cantidad tampoco debería ser tomado en cuenta para 
		-- la repartición, porque se producen datos erroneos
		WAITFOR DELAY '00:00:15';
		UPDATE sp SET
			balance = balance + @monto
		FROM sedesProdu sp
		INNER JOIN addresses ad ON ad.addressID = sp.addressID
		INNER JOIN ciudades ci ON ci.ciudadID = ad.ciudadID
		INNER JOIN estados es ON es.estadoID = ci.estadoID 
		WHERE (ci.ciudadID = @ciudadID OR @ciudadID IS NULL)
		AND (es.estadoID = @estadoID OR @estadoID IS NULL)
		AND (sp.sedeProduID = @sedeProduID2 OR @sedeProduID2 IS NULL)
		AND (sp.industriaTypeID = @industriaTypeID OR @industriaTypeID IS NULL)

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
