if OBJECT_ID('ListarDadosPaciente') is not null 
DROP PROC ListarDadosPaciente

GO

CREATE PROC ListarDadosPaciente
@numeroBeneficiario int
AS
BEGIN
-- LISTAR MEDICAMENTOS DO PACIENTE x
	SELECT Medicamento.idMedicamento, Medicamento.nomeComercial, Medicamento.laboratorio,
		   Medicamento.principioActivo, Medicamento.dose, MedicamentoPaciente.posologia FROM Medicamento INNER JOIN MedicamentoPaciente
		   ON Medicamento.idMedicamento = MedicamentoPaciente.idMedicamento
		   WHERE MedicamentoPaciente.idPaciente = @numeroBeneficiario 


-- LISTAR CONSULTAS DO PACIENTE x
	SELECT Consulta.idConsulta, Consulta.data, Consulta.dataRegisto, Consulta.especialidadeConsulta,
		   Consulta.medicoConsulta, Consulta.motivo FROM Consulta
		   WHERE Consulta.pacienteConsulta = @numeroBeneficiario

-- LISTAR DADOS PESSOAIS PACIENTE x
	DECLARE @bi int
	SELECT @bi = bi 
	FROM Pessoa INNER JOIN Paciente ON (pessoa = bi) 
	WHERE numeroBenefeciario = @numeroBeneficiario
	EXEC dbo.ListarDadosPessoais @bi
					
END

-- EXEC ListarDadosPaciente 1