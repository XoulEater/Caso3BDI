CREATE OR ALTER VIEW Vista_Dinamica
AS
SELECT 
    c.containerID AS codigoContainer, 
    c.durability AS HP, 
    cd.description AS tdesecho,
	mo.name AS modelo,
	ma.name AS brand
FROM dbo.containers c 
INNER JOIN dbo.containerTypes ct ON c.containerTypeID = ct.containerTypeID --Tipo Contenedor
INNER JOIN dbo.modelos mo ON ct.modeloID = mo.modeloID -- Modelos con Type 
INNER JOIN dbo.marcas ma ON mo.brandID = ma.brandID -- Marcas con modelos Type
INNER JOIN dbo.clasesDesecho cd ON ct.claseDesechoID = cd.claseDesechoID --    ClaseDesecho con Type
WHERE c.durability >= 20 AND c.containerID > 500
GO

CREATE OR ALTER VIEW Vista_Indexada
WITH SCHEMABINDING
AS
SELECT 
    c.containerID AS codigoContainer, 
    c.durability AS HP, 
    cd.description AS tdesecho,
	mo.name AS modelo,
	ma.name AS brand
FROM dbo.containers c 
INNER JOIN dbo.containerTypes ct ON c.containerTypeID = ct.containerTypeID --Tipo Contenedor
INNER JOIN dbo.modelos mo ON ct.modeloID = mo.modeloID -- Modelos con Type 
INNER JOIN dbo.marcas ma ON mo.brandID = ma.brandID -- Marcas con modelos Type
INNER JOIN dbo.clasesDesecho cd ON ct.claseDesechoID = cd.claseDesechoID --    ClaseDesecho con Type
WHERE c.durability >= 20 AND c.containerID > 500
GO

CREATE UNIQUE CLUSTERED INDEX IDX_VistaIndexada ON dbo.Vista_Indexada (codigoContainer, HP) 


SELECT * FROM Vista_Indexada WITH (NOEXPAND)
ORDER BY HP ASC

SELECT * FROM Vista_Dinamica 
ORDER BY HP ASC


EXECUTE generarContainers 1000
