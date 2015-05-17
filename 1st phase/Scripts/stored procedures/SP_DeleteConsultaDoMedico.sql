if OBJECT_ID('DeleteConsultaDoMedico') is not null 
DROP PROC DeleteConsultaDoMedico

GO

CREATE PROC DeleteConsultaDoMedico
@licenca int, @idConsulta int
AS
BEGIN
	DELETE FROM Consulta
	WHERE	
		medicoConsulta = @licenca AND idConsulta = @idConsulta
END

-- EXeC DeleteConsultaDoMedico 11, 3