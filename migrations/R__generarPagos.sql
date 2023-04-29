CREATE OR ALTER PROCEDURE generarPagos
	@Date DATETIME,
	@Cantidad INT
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @Contador INT;
	DECLARE @Desecho INT;
	DECLARE @Contrato INT;
	DECLARE @CantDesecho INT;
	DECLARE @PagoID INT;
	DECLARE @Monto INT;
	DECLARE @Data AS transactionData;
	SET @Contador = 0;

	WHILE @Contador <= @Cantidad
	BEGIN
		SELECT TOP 1 @Desecho = desechoID FROM desechos ORDER BY NEWID() 
		SET @CantDesecho = FLOOR(RAND() * 50) + 10 
		SET @Contrato = FLOOR(RAND() * 4) + 2

		SELECT @Monto = SUM(pp.precio) * @CantDesecho
		FROM preciosProce pp
		INNER JOIN procesos p ON p.procesoID = pp.procesoID
		WHERE p.desechoID = @Desecho

		INSERT INTO [dbo].[pagosProcesamiento]
			([posttime],[monto],[plantaID],[contratoID],[desechoID],[cantidad],[createdAt],[computer],[username],[monedaID])
		VALUES
			(@Date, @Monto, 3, @Contrato, @Desecho, @CantDesecho, @Date, 'computer1', 'user1', 1)
		SET @PagoID = SCOPE_IDENTITY()

		INSERT INTO @Data (actorID, monto, posttime, monedaID)
		SELECT CASE WHEN actorID <= 16 THEN 30 ELSE actorID END AS actorID , @Monto * cms.porcentaje, @Date, 1
		FROM contratos ctt 
		INNER JOIN comisiones cms ON cms.comisionID = ctt.comisionID
		WHERE contratoID = @Contrato

		INSERT INTO @Data (actorID, monto, posttime, monedaID)
		SELECT TOP 1 actorID, @Monto * -1, @Date, 1
		FROM contratos ctt 
		INNER JOIN comisiones cms ON cms.comisionID = ctt.comisionID
		WHERE contratoID = @Contrato

		EXEC generateTransaction @Data, 1, @PagoID

		SELECT @Date = DATEADD(hour, FLOOR(RAND() * 24) + 1, @Date)
		SET @Contador = @Contador + 1
		DELETE FROM @Data;
	END

    
END
GO