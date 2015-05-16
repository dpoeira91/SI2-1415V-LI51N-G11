if OBJECT_ID('ListarDadosMedico') is not null 
DROP PROC ListarDadosMedico

GO

CREATE PROC ListarDadosMedico
@bi int
AS
BEGIN

-- LISTAR CONSULTAS DO MEDICO x
	SELECT Consulta.idConsulta, Consulta.data, Consulta.dataRegisto, Consulta.especialidadeConsulta,
		   Consulta.motivo, Consulta.pacienteConsulta FROM Consulta INNER JOIN Medico 
		   ON Medico.licencaMedica = Consulta.medicoConsulta
	WHERE Medico.pessoa = @bi

-- LISTAR ESPECIALIDADES DO MEDICO x
	SELECT Especialidade.nome FROM Especialidade INNER JOIN MedicoEspecialidade ON Especialidade.idEspecialidade = MedicoEspecialidade.idEspecialidade
												 INNER JOIN Medico ON MedicoEspecialidade.licenca = Medico.licencaMedica
	WHERE Medico.pessoa = @bi

-- LISTAR DADOS PESSOAIS MEDICO x
	EXEC ListarDadosPessoais @bi
END

-- EXEC ListarDadosMedico 3