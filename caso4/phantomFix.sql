CREATE OR ALTER PROCEDURE [dbo].[RepartirSponsors]
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
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001;

		-- Insert statements for procedure here
		WAITFOR DELAY '00:00:15';
		
		WITH CTE AS (
			SELECT COUNT(*) AS cantidad
			FROM sedesProdu sp
			INNER JOIN addresses ad ON ad.addressID = sp.addressID
			INNER JOIN ciudades ci ON ci.ciudadID = ad.ciudadID
			INNER JOIN estados es ON es.estadoID = ci.estadoID 
			WHERE (ci.ciudadID = @ciudadID OR @ciudadID IS NULL)
			AND (es.estadoID = @estadoID OR @estadoID IS NULL)
			AND (sp.sedeProduID = @sedeProduID2 OR @sedeProduID2 IS NULL)
			AND (sp.industriaTypeID = @industriaTypeID OR @industriaTypeID IS NULL)
		)

		UPDATE sp 
		SET balance = balance + (@monto / (SELECT cantidad FROM CTE))
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
GO

EXEC RepartirSponsors 3000, 1

Select * from sedesProdu

-- Prueba de ser necesario
INSERT INTO [dbo].[sedesProdu]
           ([empresaID]
           ,[addressID]
           ,[description]
           ,[industriaTypeID])
     VALUES
           (9,16,'MCRonald5',1)