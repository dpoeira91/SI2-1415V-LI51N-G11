if OBJECT_ID('MedicoDisponivel') is not null
DROP FUNCTION MedicoDisponivel

GO

CREATE FUNCTION MedicoDisponivel(@medico int,@data date)
RETURNS BIT
AS
BEGIN
	IF((SELECT COUNT(idConsulta) FROM Consulta WHERE medicoConsulta = @medico AND data = @data) < (SELECT numeroPacientesDiario FROM Medico WHERE licencaMedica = @medico))
		RETURN 1
	RETURN 0
END
GO