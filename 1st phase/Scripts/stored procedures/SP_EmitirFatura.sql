IF OBJECT_ID('EmitirFatura') is not null
DROP PROC EmitirFatura

GO
CREATE PROC EmitirFatura @idFatura int
AS 
BEGIN
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	BEGIN TRAN
	UPDATE Fatura SET estado = 'emitida' , montante = montante * dbo.CalculaBonus(nif) WHERE ano = YEAR(GETDATE()) AND idFatura = @idFatura
	DECLARE @bonus int,@numBenef int
	SELECT @bonus = bonus,@numBenef = numeroBenefeciario 
	FROM Paciente INNER JOIN Pessoa ON(pessoa = bi) 
	INNER JOIN Fatura ON (Pessoa.nif = Fatura.nif)
	WHERE ano = YEAR(GETDATE()) AND idFatura = @idFatura
	IF @bonus = 1000 SET @bonus = 0
	UPDATE Paciente 
	SET temDesconto = 0 ,bonus = @bonus
	WHERE numeroBenefeciario = @numBenef
	COMMIT
END
GO

EXEC dbo.EmitirFatura 3