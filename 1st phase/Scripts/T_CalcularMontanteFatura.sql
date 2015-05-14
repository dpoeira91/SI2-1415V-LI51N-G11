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
	SET montante += (SELECT montante FROM inserted 
						WHERE Fatura.idFatura = inserted.idFatura)


GO

CREATE TRIGGER DeleteMontante
ON ItemFatura
AFTER DELETE
AS
	UPDATE Fatura 
	SET montante -= (SELECT montante FROM deleted 
						WHERE Fatura.idFatura = deleted.idFatura)

GO

CREATE TRIGGER UpdateMontante
ON ItemFatura
AFTER UPDATE
AS
	UPDATE Fatura 
	SET montante += (SELECT montante FROM inserted 
						WHERE Fatura.idFatura = inserted.idFatura) - (SELECT montante FROM deleted 
						WHERE Fatura.idFatura = deleted.idFatura)

GO