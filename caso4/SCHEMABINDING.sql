-- Crear vista indexada con SCHEMABINDING
CREATE VIEW dbo.verPaises
WITH SCHEMABINDING
AS
SELECT paisID, nombre
FROM [dbo].[paises]
GO

-- Crear un �ndice �nico en la vista
CREATE UNIQUE CLUSTERED INDEX idx_VistaVerPaises
ON dbo.verPaises (paisID)
GO

-- Intentar cambiar la estructura de la tabla Clientes
ALTER TABLE dbo.paises
ALTER COLUMN nombre NVARCHAR(255) NULL