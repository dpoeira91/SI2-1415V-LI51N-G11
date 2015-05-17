use clinica
GO
if OBJECT_ID('VerificarPessoaBi') is not null 
DROP FUNCTION VerificarPessoaBi

GO

CREATE FUNCTION VerificarPessoaBi(@bi int)
RETURNS BIT
AS
BEGIN
	IF(SELECT 1 FROM Pessoa WHERE Pessoa.bi = @bi) = 1
		RETURN 1
	RETURN 0
END

GO