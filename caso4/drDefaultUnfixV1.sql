ALTER   PROCEDURE [dbo].[test]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    -- Insert statements for procedure here
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
    ) 
    SELECT 
        DATEPART(WEEK, tl.posttime) AS Semana, 
        Actor,
        SUM(tl.monto) 
    FROM 
        actores_CTE a INNER JOIN 
        transactionLogs tl  WITH (READUNCOMMITTED) ON a.actorID = tl.actorID
    GROUP BY DATEPART(WEEK, tl.posttime), Actor
    ORDER BY DATEPART(WEEK, tl.posttime)

END

exec test



