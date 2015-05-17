IF OBJECT_ID('Remarcacao') is not null
DROP PROC Remarcacao

GO
CREATE PROC Remarcacao @medico int, @especialidade int, @paciente int, @data date, @motivo nvarchar(50)
AS
BEGIN
	BEGIN TRAN
		DECLARE @err int
		EXEC MarcarConsulta @paciente, @medico, @especialidade, @data, @motivo, @err out
		-- OPÇÃO DE ESCOLHA
		IF ( @err >=2)
			BEGIN
				SELECT Medico.pessoa, Medico.licencaMedica, Medico.dataLicenca
				FROM Medico INNER JOIN Consulta ON (licencaMedica = medicoConsulta)
							INNER JOIN MedicoEspecialidade ON (licenca = licencaMedica)
				WHERE idEspecialidade = @especialidade AND 
					  data = @data AND
					  COUNT(idConsulta) < numeroPacientesDiario
				-- PACIENTE ESCOLHE
				EXEC MarcarConsulta @paciente,3,@especialidade,@data,@motivo,@err
				IF(SELECT 1 FROM ListaDeEspera WHERE medico = @medico AND paciente = @paciente AND data = @data AND especialidade = @especialidade) = 1
					DELETE FROM ListaDeEspera WHERE medico = @medico AND paciente = @paciente AND data = @data AND especialidade = @especialidade
			END
	COMMIT
END
GO

EXEC dbo.Remarcacao 1, 22, 1, '2015-05-13', 'inicial'