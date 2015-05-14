use clinica
GO
CREATE FUNCTION VerificarPessoa(@nif int , @nome nvarchar(1250))
RETURNS BIT
AS
BEGIN
	RETURN (SELECT 1 FROM Pessoa 
				WHERE Pessoa.Nif = @nif AND Pessoa.Nome = @nome)
END

GO