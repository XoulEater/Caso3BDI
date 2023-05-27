ALTER PROCEDURE [dbo].[VentasJava3]
	-- Add the parameters for the stored procedure here
	@productosGroup ProductosGroupType READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE MyCursor CURSOR FOR SELECT productosGroupID, productoID, cantidad FROM @productosGroup;
	DECLARE @grupoID VARCHAR(36)
	DECLARE @productoID INT
	DECLARE @cantidad INT
	DECLARE @existencias INT
	DECLARE @ordenID INT
	DECLARE @lastLotes INT

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	BEGIN TRY
		SET @CustomError = 2001
	
		OPEN MyCursor
		FETCH NEXT FROM MyCursor INTO @grupoID, @productoID, @cantidad
		WHILE @@FETCH_STATUS = 0
		BEGIN 
		
			SELECT @existencias = SUM(existencias) 
			FROM lotes WITH (UPDLOCK, ROWLOCK) -- Agregar sugerencia de bloqueo
			WHERE productoID = @productoID

			IF @existencias >= @cantidad BEGIN 

				INSERT INTO [dbo].[ordenProdus]([ordenProduID],[cantidad])
				VALUES (@grupoID, @cantidad)
				SET @ordenID = SCOPE_IDENTITY()

				WHILE @cantidad > 0
				BEGIN
					WITH LotesDisponibles AS (
						SELECT loteID, existencias
						FROM lotes WITH (UPDLOCK, ROWLOCK) -- Agregar sugerencia de bloqueo
						WHERE existencias > 0 and productoID = @productoID
					)
					INSERT INTO lotesXorden (loteID ,ordenID, cantidad)
					SELECT TOP 1 loteID, @ordenID, CASE WHEN @cantidad < Existencias THEN @cantidad ELSE Existencias END
					FROM LotesDisponibles
					ORDER BY loteID;

					-- Agregar un retraso de espera para evitar bloqueos excesivos
					WAITFOR DELAY '00:00:10';

					UPDATE l SET
						existencias = CASE WHEN @cantidad < Existencias THEN existencias - @cantidad ELSE 0 END
					FROM Lotes l
					INNER JOIN lotesXorden lo ON l.loteID = lo.loteID
					WHERE lo.ordenID = @ordenID;

					SET @cantidad = @cantidad - (
						SELECT TOP (1) Cantidad
						FROM lotesXorden 
						WHERE ordenID = @ordenID
						ORDER BY loteID DESC
					)
				END
			END
			ELSE BEGIN
				-- No hay suficientes existencias, realizar rollback y salir del bucle

				ROLLBACK TRANSACTION;
				CLOSE MyCursor
				DEALLOCATE MyCursor
				RETURN
			END
			FETCH NEXT FROM MyCursor INTO @grupoID, @productoID, @cantidad
		END -- Fin del bucle WHILE
		
		EXEC RegistrarVentas @grupoID

		IF @InicieTransaccion = 1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion = 1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	

	CLOSE MyCursor
	DEALLOCATE MyCursor

END -- Fin del procedimiento almacenado

DECLARE @tvp [dbo].[ProductosGroupType]
INSERT INTO @tvp
VALUES (NEWID(), 1, 20)
EXEC [VentasJava3] @tvp

select * from lotes



