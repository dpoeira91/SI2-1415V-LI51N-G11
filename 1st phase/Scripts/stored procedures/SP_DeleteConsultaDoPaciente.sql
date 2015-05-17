if OBJECT_ID('DeleteConsultaDoPaciente') is not null 
DROP PROC DeleteConsultaDoPaciente

GO

CREATE PROC DeleteConsultaDoPaciente
@numBeneficiarioPaciente int, @idConsulta int
AS
BEGIN
	DELETE FROM Consulta
	WHERE	
		pacienteConsulta = @numBeneficiarioPaciente AND idConsulta = @idConsulta
END

-- EXeC DeleteConsultaDoPaciente 1, 2