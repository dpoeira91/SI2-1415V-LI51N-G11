use clinica
if OBJECT_ID('ListarDadosMedico') is not null 
DROP PROC ListarDadosMedico

GO

CREATE PROC ListarDadosMedico
@licenca int
AS
BEGIN

-- LISTAR CONSULTAS DO MEDICO x
	SELECT Consulta.idConsulta, Consulta.data, Consulta.dataRegisto, Consulta.especialidadeConsulta,
		   Consulta.motivo, Consulta.pacienteConsulta FROM Consulta INNER JOIN Medico 
		   ON Medico.licencaMedica = Consulta.medicoConsulta
	WHERE Medico.licencaMedica = @licenca

-- LISTAR ESPECIALIDADES DO MEDICO x
	SELECT Especialidade.nome FROM Especialidade INNER JOIN MedicoEspecialidade ON Especialidade.idEspecialidade = MedicoEspecialidade.idEspecialidade
												 INNER JOIN Medico ON MedicoEspecialidade.licenca = Medico.licencaMedica
	WHERE Medico.licencaMedica = @licenca

-- LISTAR DADOS PESSOAIS MEDICO x
	DECLARE @bi int
	SELECT @bi = bi 
	FROM Pessoa INNER JOIN Medico ON (pessoa = bi) 
	WHERE licencaMedica = @licenca
	EXEC ListarDadosPessoais @bi
END

-- EXEC ListarDadosMedico 33