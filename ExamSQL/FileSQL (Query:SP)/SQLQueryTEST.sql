--1 

SELECT * 
FROM Verbale;

--2 

SELECT v.IDAnagrafe, COUNT(*) AS VerbaliTrascritti
FROM dbo.Verbale v
WHERE v.DataTrascrizioneVerbale IS NOT NULL
GROUP BY v.IDAnagrafe;

--3 

SELECT tv.Descrizione AS TipoViolazione, COUNT(*) AS VerbaliTrascritti
FROM dbo.Verbale v
JOIN dbo.TipoDiViolazione tv ON v.IDTipoViolazione = tv.IDViolazione
WHERE v.DataTrascrizioneVerbale IS NOT NULL
GROUP BY tv.Descrizione;

--4  

SELECT v.IDAnagrafe, SUM(v.DecurtamentoPunti) AS TotalePuntiDecurtati
FROM dbo.Verbale v
GROUP BY v.IDAnagrafe;

--5 

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
    a.Città = 'Palermo';

--6

SELECT 
    a.Cognome, 
    a.Nome, 
    a.Indirizzo, 
    v.DataViolazione, 
    v.Importo, 
    v.DecurtamentoPunti
FROM 
    dbo.Anagrafica a
JOIN 
    dbo.Verbale v ON a.IDAnagrafica = v.IDAnagrafe
WHERE 
    v.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';

--7 

SELECT 
    a.IDAnagrafica,
    a.Cognome, 
    a.Nome, 
    SUM(v.Importo) AS TotaleImporti
FROM 
    dbo.Anagrafica a
JOIN 
    dbo.Verbale v ON a.IDAnagrafica = v.IDAnagrafe
GROUP BY 
    a.IDAnagrafica, a.Cognome, a.Nome;

--8

SELECT *
FROM dbo.Anagrafica
WHERE Città = 'Palermo';

--9 

DECLARE @DataViolazione DATE = '2009-02-21';

SELECT 
    DataViolazione, 
    Importo, 
    DecurtamentoPunti
FROM 
    dbo.Verbale
WHERE 
    DataViolazione = @DataViolazione;

--10

SELECT 
    Nominativo_Agente,
    COUNT(*) AS ViolazioniContestate
FROM 
    dbo.Verbale
GROUP BY 
    Nominativo_Agente;

--11 

SELECT 
    a.Cognome, 
    a.Nome, 
    a.Indirizzo, 
    v.DataViolazione, 
    v.Importo, 
    v.DecurtamentoPunti
FROM 
    dbo.Anagrafica a
JOIN 
    dbo.Verbale v ON a.IDAnagrafica = v.IDAnagrafe
WHERE 
    v.DecurtamentoPunti > 5;

--12 

SELECT 
    a.Cognome, 
    a.Nome, 
    a.Indirizzo, 
    v.DataViolazione, 
    v.Importo, 
    v.DecurtamentoPunti
FROM 
    dbo.Anagrafica a
JOIN 
    dbo.Verbale v ON a.IDAnagrafica = v.IDAnagrafe
WHERE 
    v.Importo > 400;

