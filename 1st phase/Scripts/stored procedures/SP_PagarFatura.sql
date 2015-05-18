IF OBJECT_ID('PagarFatura') is not null
DROP PROC PagarFatura

GO
CREATE PROC PagarFatura @idFatura int, @ano int
AS 
BEGIN
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	BEGIN TRAN
	UPDATE Fatura SET estado = 'paga' 
	WHERE idFatura = @idFatura AND ano = @ano
	DECLARE @bonus int,@montante decimal,@desconto bit = 0,@numeroBenef int , @newBonus int
	SELECT @bonus = bonus, @montante = montante ,@numeroBenef = numeroBenefeciario
	FROM Paciente INNER JOIN Pessoa ON(pessoa = bi) 
	INNER JOIN Fatura ON (Pessoa.nif = Fatura.nif)
	WHERE idFatura = @idFatura AND ano = @ano
	IF (@bonus+@montante)/100 != @bonus/100 SET  @desconto = 1
	SET @newBonus = @bonus+@montante
	IF (@newBonus > 1000) SET @newBonus = 1000
	UPDATE Paciente SET bonus +=@newBonus , temDesconto = @desconto WHERE numeroBenefeciario = @numeroBenef
	COMMIT
END
GO