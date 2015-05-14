CREATE FUNCTION VerificarPessoa(@nif int , @nome nvarchar(1250))
RETURNS BIT
AS
BEGIN
	RETURN (SELECT 1 FROM Pessoa 
				WHERE Pessoa.nif = @nif AND Pessoa.nome = @nome)
END

GO