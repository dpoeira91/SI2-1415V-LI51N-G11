if OBJECT_ID('UpdateTelefone') is not null 
DROP PROC UpdateTelefone

GO

CREATE PROC UpdateTelefone
@bi int,@ordem int, @numero nvarchar(20), @tipo int
AS
BEGIN
	UPDATE Telefone
	SET
		Telefone.numero = @numero,
		Telefone.tipo = @tipo
	WHERE
		Telefone.pessoa = @bi AND
		Telefone.ordem = @ordem
END

--- TESTES ---
/*
EXEC UpdateTelefone 1,4, '54321', 2
*/