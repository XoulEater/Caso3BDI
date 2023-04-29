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
	act.objectTypeID, 
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
	act.objectTypeID, 
	pp.contratoID 
ORDER BY Semana
FOR JSON PATH