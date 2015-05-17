IF OBJECT_ID('EmitirFatura') is not null
DROP PROC EmitirFatura

GO
CREATE PROC EmitirFatura @idFatura int
AS 
BEGIN
	UPDATE Fatura SET estado = 'emitida' , montante = montante * dbo.CalculaBonus(nif) WHERE ano = YEAR(GETDATE()) AND idFatura = @idFatura
	IF @@ROWCOUNT = 0
		PRINT('A Fatura não foi encontrada!')
	ELSE 
		BEGIN
		UPDATE Paciente 
		SET temDesconto = 0 
		WHERE numeroBenefeciario = (SELECT numeroBenefeciario 
									FROM Paciente INNER JOIN Pessoa ON(pessoa = bi) 
									INNER JOIN Fatura ON (Pessoa.nif = Fatura.nif)
									WHERE ano = YEAR(GETDATE()) AND idFatura = @idFatura)
		END
END
GO

EXEC dbo.EmitirFatura 3