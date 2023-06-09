-- JOB A
CREATE OR ALTER PROCEDURE [dbo].[SaveBitacora]
AS
BEGIN 
	INSERT INTO [MSI\SQLEXPRESS].[EVBackup].[dbo].[eventLogs] ([posttime],[computer],[username],[checksum],[description],[reference1],[reference2],[value1],[value2],[enable],[sourceID],[levelID],[eventTID],[objectTypeID])
    SELECT [posttime],[computer],[username],[checksum],[description],[reference1],[reference2],[value1],[value2],[enable],[sourceID],[levelID],[eventTID],[objectTypeID]
	FROM [dbo].[eventLogs]
          
	DELETE FROM [dbo].[eventLogs]
END
GO 

-- JOB B
CREATE OR ALTER PROCEDURE [dbo].[RecompilarSP]
AS
BEGIN 
	DECLARE @Command NVARCHAR(MAX)
	DECLARE @ProcedureName NVARCHAR(MAX)

	DECLARE ProcedureCursor CURSOR FOR
	SELECT SCHEMA_NAME(schema_id) + '.' + name
	FROM sys.procedures
	WHERE type = 'P'

	OPEN ProcedureCursor

	FETCH NEXT FROM ProcedureCursor INTO @ProcedureName

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Command = 'EXEC sp_recompile ''' + @ProcedureName + ''''
		EXEC sp_executesql @Command
    
		FETCH NEXT FROM ProcedureCursor INTO @ProcedureName
	END

	CLOSE ProcedureCursor
	DEALLOCATE ProcedureCursor
END
GO 
