CREATE OR ALTER PROCEDURE generarContainers @cantidad int
AS
BEGIN
	DECLARE @contador INT;
    SET @contador = 1;

	 WHILE @contador <= @cantidad
	 BEGIN
		
		INSERT INTO [dbo].[containers]
				   ([durability]
				   ,[containerTypeID]
				   ,[createdAt]
				   ,[computer]
				   ,[username])
			 VALUES
				   ( FLOOR(RAND()*(100)+1), FLOOR(RAND()*(23 - 4 + 1)+4), GETDATE(),'Computer1','user1');
        SET @contador = @contador + 1;
    END;

END;
