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
	IF(dbo.MedicoDisponivel(@medico,@data) = 1)
	BEGIN
		INSERT INTO Consulta(motivo, data, dataRegisto, pacienteConsulta, medicoConsulta, especialidadeConsulta)
			values(@motivo, @data, GETDATE(), @paciente, @medico, @especialidade)
		PRINT('A consulta foi marcada com sucesso!')
		RETURN
	END
	ELSE
	BEGIN
		IF dbo.ListaDeEsperaCheia(@medico,@data) = 0
		BEGIN
			INSERT INTO ListaDeEspera(medico,paciente,especialidade, data)
				values(@medico,@paciente,@especialidade,@data)
			PRINT('O médico tem o dia cheio, foi adicionado á lista de espera!')
			RETURN
		END
	END
	PRINT('O médico tem o dia cheio, foi adicionado á lista de espera!')
END

GO

---- TESTES ----
EXEC MarcarConsulta 3, 22, 1, '2015-05-13', 'inicial' -- x
EXEC MarcarConsulta 3, 33, 1, '2015-05-13', 'inicial' -- x
EXEC MarcarConsulta 1, 22, 1, '2015-05-13', 'inicial' -- v