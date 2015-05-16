if OBJECT_ID('ListarDadosMedico') is not null 
DROP PROC ListarDadosMedico

GO

CREATE PROC ListarDadosMedico
@bi int
AS
BEGIN
	SELECT Consulta.idConsulta, Consulta.data, Consulta.dataRegisto, Consulta.especialidadeConsulta,
		   Consulta.motivo, Consulta.pacienteConsulta FROM Consulta INNER JOIN Medico 
		   ON Medico.pessoa = C
END