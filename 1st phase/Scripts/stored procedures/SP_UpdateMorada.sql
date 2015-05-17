if OBJECT_ID('UpdateMorada') is not null 
DROP PROC UpdateMorada

GO

CREATE PROC UpdateMorada
@bi int,@ordem int, @rua nvarchar(50), @cidade nvarchar(20), @numero nvarchar(20), @pais nvarchar(20), @cp nvarchar(20), @tipo int
AS
BEGIN
	UPDATE Morada 
	SET 
		Morada.rua = @rua,
		Morada.cidade = @cidade,
		Morada.numero = @numero,
		Morada.pais = @pais,
		Morada.codigoPostal = @cp,
		Morada.tipo = @tipo
	WHERE 
		Morada.pessoa = @bi AND
		Morada.ordem = @ordem
END

--- TESTES ----
/*
EXEC UpdateMorada 2 ,1, 'BANANA','BANANA','BANANA','BANANA','BANANA',2
*/