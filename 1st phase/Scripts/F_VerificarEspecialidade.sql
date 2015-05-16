GO
if OBJECT_ID('VerificarEspecialidade') is not null 
DROP FUNCTION VerificarEspecialidade

GO

CREATE FUNCTION VerificarEspecialidade(@idEspecialidade int)
RETURNS BIT
AS
BEGIN
--DECLARE @count int - possibilidade
	IF(SELECT 1 FROM Especialidade WHERE idEspecialidade = @idEspecialidade) = 1
		RETURN 1
	RETURN 0
END
