CREATE PROCEDURE VisualizzaTotalePuntiDecurtatiPerData
    @DataViolazione DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        SUM(DecurtamentoPunti) AS TotalePuntiDecurtati
    FROM 
        dbo.Verbale
    WHERE 
        DataViolazione = @DataViolazione;
END;
