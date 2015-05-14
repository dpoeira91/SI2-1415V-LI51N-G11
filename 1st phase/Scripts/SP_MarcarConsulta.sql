if OBJECT_ID('MarcarConsulta') is not null 
DROP PROC MarcarConsulta

GO

CREATE PROC MarcarConsulta
@paciente int , @medico int, @especialidade int, @data date, @motivo nvarchar(50)

AS
BEGIN
	IF(dbo.MedicoNotPaciente(@paciente, @medico) = 1)
	BEGIN
		PRINT('O médico e paciente de uma consulta não podem ser a mesma pessoa!') -- RAISEERROR
		return
	END
	IF(dbo.FaturasEmDivida(@paciente) > 5)
	BEGIN
		PRINT('O paciente tem 5 ou mais faturas por pagar!') -- RAISEERROR 
		return
	END
	INSERT INTO Consulta(motivo, data, dataRegisto, pacienteConsulta, medicoConsulta, especialidadeConsulta)
		values(@motivo, @data, GETDATE(), @paciente, @medico, @especialidade)
	PRINT('A consulta foi marcada com sucesso!')
END

GO

---- TESTES ----
EXEC MarcarConsulta 3, 22, 1, '2015-05-13', 'inicial' -- x
EXEC MarcarConsulta 3, 33, 1, '2015-05-13', 'inicial' -- x
EXEC MarcarConsulta 1, 22, 1, '2015-05-13', 'inicial' -- v