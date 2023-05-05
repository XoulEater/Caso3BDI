WITH actores_CTE (actorID, Actor)
AS
(
SELECT 
	actorID, 
	COALESCE(sp.description, sr.description, act.freeName) AS Actor 
FROM 
	actores act 
	LEFT MERGE JOIN sedesProdu sp ON sp.sedeProduID = act.referenceID AND act.objectTypeID = 1 -- Para asociarlo al nombre del productor
	LEFT MERGE JOIN sedesReco sr ON sr.sedeRecoID = act.referenceID AND act.objectTypeID = 2 -- Para asociarlo al nombre del productor
WHERE 
	actorID != 30 -- eliminamos al actor 30
),
pagos_CTE (Semana, Actor, contratoID, monto, discount, pagoProcesamientoID)
AS 
(
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
	INNER JOIN actores_CTE act ON act.actorID = tl.actorID  
WHERE
	tl.transactionTypeID = 1
	AND DATEPART(week,tl.posttime) > 10
GROUP BY 
	DATEPART(week,tl.posttime), 
	Actor, 
	contratoID 
) 
SELECT 
	*
FROM pagos_CTE
ORDER BY Semana