if OBJECT_ID('InsertMontante') is not null 
DROP TRIGGER InsertMontante

if OBJECT_ID('DeleteMontante') is not null 
DROP TRIGGER DeleteMontante

if OBJECT_ID('UpdateMontante') is not null 
DROP TRIGGER UpdateMontante

GO

CREATE TRIGGER InsertMontante
ON ItemFatura
AFTER INSERT
AS
	DECLARE @nif int
	SELECT @nif = nif FROM inserted INNER JOIN Fatura ON(Fatura.idFatura = inserted.idFatura)
	UPDATE Fatura
	SET montante += (SELECT montante FROM inserted 
						WHERE Fatura.idFatura = inserted.idFatura) * (dbo.CalculaBonus( @nif ))


GO

CREATE TRIGGER DeleteMontante
ON ItemFatura
AFTER DELETE
AS
	DECLARE @nif int
	SELECT @nif = nif FROM deleted INNER JOIN Fatura ON(Fatura.idFatura = deleted.idFatura)
	UPDATE Fatura 
	SET montante -= (SELECT montante FROM deleted 
						WHERE Fatura.idFatura = deleted.idFatura) * (dbo.CalculaBonus( @nif ))

GO

CREATE TRIGGER UpdateMontante
ON ItemFatura
AFTER UPDATE
AS
	DECLARE @nif int
	SELECT @nif = nif FROM inserted INNER JOIN Fatura ON(Fatura.idFatura = inserted.idFatura)
	UPDATE Fatura 
	SET montante += ((SELECT montante FROM inserted 
						WHERE Fatura.idFatura = inserted.idFatura) - (SELECT montante FROM deleted 
						WHERE Fatura.idFatura = deleted.idFatura))  * (dbo.CalculaBonus( @nif ))

GO