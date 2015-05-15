use clinica
GO

CREATE FUNCTION VerificarMedico (@bi int)
RETURNS BIT
AS
BEGIN
	RETURN (SELECT 1 FROM Medico 
				WHERE pessoa = @bi)
END
GO