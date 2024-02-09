CREATE PROCEDURE VisualizzaContravvenzioniPerAnno
    @Anno INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        a.Cognome, 
        a.Nome, 
        v.DataViolazione, 
        v.IndirizzoViolazione, 
        v.Importo, 
        v.DecurtamentoPunti
    FROM 
        dbo.Anagrafica a
    JOIN 
        dbo.Verbale v ON a.IDAnagrafica = v.IDAnagrafe
    WHERE 
        YEAR(v.DataViolazione) = @Anno;
END;
