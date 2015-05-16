IF OBJECT_ID('EmitirFatura') is not null
DROP PROC EmitirFatura

GO
CREATE PROC EmitirFatura @ano int, @idFatura int
AS 
BEGIN
	UPDATE Fatura SET estado = 'emitida' WHERE ano = @ano AND idFatura = @idFatura
	IF @@ROWCOUNT = 0
		PRINT('A Fatura não foi encontrada!')
END
GO

EXEC dbo.EmitirFatura 1 , 1