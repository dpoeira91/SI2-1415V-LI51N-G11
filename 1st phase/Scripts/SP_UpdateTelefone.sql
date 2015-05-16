if OBJECT_ID('UpdateTelefone') is not null 
DROP PROC UpdateTelefone

GO

CREATE PROC UpdateTelefone
@bi int, @numero nvarchar(20), @tipo nvarchar(20)
AS
BEGIN
	UPDATE Telefone
	SET
		Telefone.numero = @numero,
		Telefone.tipo = @tipo
	WHERE
		Telefone.pessoa = @bi
END