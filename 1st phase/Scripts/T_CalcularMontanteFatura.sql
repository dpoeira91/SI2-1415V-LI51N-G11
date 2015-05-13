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
	UPDATE Fatura 
	SET Montante += (SELECT Montante FROM inserted 
						WHERE Fatura.IdFatura = inserted.IdFatura)


GO

CREATE TRIGGER DeleteMontante
ON ItemFatura
AFTER DELETE
AS
	UPDATE Fatura 
	SET Montante -= (SELECT Montante FROM deleted 
						WHERE Fatura.IdFatura = deleted.IdFatura)

GO

CREATE TRIGGER UpdateMontante
ON ItemFatura
AFTER UPDATE
AS
	UPDATE Fatura 
	SET Montante += (SELECT Montante FROM inserted 
						WHERE Fatura.IdFatura = inserted.IdFatura) - (SELECT Montante FROM deleted 
						WHERE Fatura.IdFatura = deleted.IdFatura)

GO