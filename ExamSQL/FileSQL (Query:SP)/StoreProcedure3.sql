CREATE PROCEDURE EliminaVerbale
    @IDVerbale INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.Verbale
    WHERE IDVerbale = @IDVerbale;
END;
