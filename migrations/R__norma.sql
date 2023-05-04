-- Norma

SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	COALESCE(sp.description, sr.description, act.freeName) AS Actor,
	pp.contratoID, 
	SUM(tl.monto) AS 'Monto Correspondiente', -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS 'Cant Transactions'
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN actores act ON act.actorID = tl.actorID  
	LEFT JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
	LEFT JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
WHERE 
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	COALESCE(sp.description, sr.description, act.freeName), 
	pp.contratoID 
EXCEPT
SELECT 
	DATEPART(week,tl.posttime) AS Semana, 
	COALESCE(sp.description, sr.description, act.freeName) AS Actor,
	pp.contratoID, 
	SUM(tl.monto) AS 'Monto Correspondiente',
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS 'Cant Transactions'
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID
	INNER JOIN actores act ON act.actorID = tl.actorID
	LEFT JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1
	LEFT JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2
WHERE 
	tl.transactionTypeID = 1 
	AND DATEPART(week,tl.posttime) > 10
	AND tl.actorID = 30 -- eliminamos al actor 30
GROUP BY 
	DATEPART(week,tl.posttime), 
	COALESCE(sp.description, sr.description, act.freeName), 
	pp.contratoID 
ORDER BY Semana
FOR JSON PATH




-- V1
SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	COALESCE(sp.description, sr.description, act.freeName) AS Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN actores act ON act.actorID = tl.actorID  
	LEFT JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
	LEFT JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
WHERE 
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	COALESCE(sp.description, sr.description, act.freeName), 
	pp.contratoID 
ORDER BY Semana


-- V2

CREATE NONCLUSTERED INDEX IX_transactionLogs_Type_Date
ON transactionLogs (transactionTypeID, posttime);
CREATE NONCLUSTERED INDEX IX_transactionLogs_actorID ON transactionLogs (actorID);

SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	COALESCE(sp.description, sr.description, act.freeName) AS Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN actores act ON act.actorID = tl.actorID  
	LEFT JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
	LEFT JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
WHERE 
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	COALESCE(sp.description, sr.description, act.freeName), 
	pp.contratoID 
ORDER BY Semana


-- V3
SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	COALESCE(sp.description, sr.description, act.freeName) AS Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN actores act ON act.actorID = tl.actorID  
	LEFT MERGE JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
	LEFT MERGE JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
WHERE 
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	COALESCE(sp.description, sr.description, act.freeName), 
	pp.contratoID 
ORDER BY Semana


-- V4
SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN 
	(
		SELECT actorID, COALESCE(sp.description, sr.description, act.freeName) AS Actor FROM actores act 
		LEFT MERGE JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
		LEFT MERGE JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
	) AS act ON act.actorID = tl.actorID  
WHERE
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	Actor, 
	pp.contratoID 
ORDER BY Semana


-- Resultado final
SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, -- Datos de los pagos
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID -- Para saber de que venta se trata
	INNER JOIN 
	(
		SELECT actorID, COALESCE(sp.description, sr.description, act.freeName) AS Actor FROM actores act 
		LEFT MERGE JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
		LEFT MERGE JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
	) AS act ON act.actorID = tl.actorID  
WHERE
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	Actor, 
	pp.contratoID 
EXCEPT
SELECT 
	DATEPART(week,tl.posttime) AS Semana, -- Agrupar por semana
	Actor,
	pp.contratoID, 
	SUM(tl.monto) AS Monto, 
	SUM(tl.discount) AS Descuento,
	COUNT(DISTINCT pp.pagoProcesamientoID) AS CantTransactions
FROM 
	transactionLogs tl
	INNER JOIN pagosProcesamiento pp ON tl.referenceID = pp.pagoProcesamientoID
	INNER JOIN 
	(
		SELECT actorID, COALESCE(sp.description, sr.description, act.freeName) AS Actor FROM actores act 
		LEFT MERGE JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 
		LEFT MERGE JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 
	) AS act ON act.actorID = tl.actorID  
WHERE
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
	AND tl.actorID = 30 -- eliminamos al actor 30
GROUP BY 
	DATEPART(week,tl.posttime), 
	Actor, 
	pp.contratoID 
ORDER BY Semana
FOR JSON PATH