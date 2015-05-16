use clinica
GO
if OBJECT_ID('VerificarPessoa') is not null 
DROP FUNCTION VerificarPessoa


GO
CREATE FUNCTION VerificarPessoa(@nif int , @nome nvarchar(1250))
RETURNS BIT
AS
BEGIN
	IF(SELECT 1 FROM Pessoa WHERE Pessoa.nif = @nif AND Pessoa.nome = @nome) = 1
		RETURN 1
	RETURN 0
END

GO