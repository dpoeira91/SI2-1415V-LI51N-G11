use clinica
DECLARE @paciente int, @medico int,@especialidade int,@data date,@motivo nvarchar(50)
SET @paciente = 1
SET @medico =  33
SET @especialidade =  1
SET @data = '2015-05-13'
SET @motivo =  'inicial'
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
					  dbo.MedicoDisponivel(Medico.licencaMedica,@data) = 1
				WAITFOR DELAY '00:00:15'
				-- PACIENTE ESCOLHE
				EXEC MarcarConsulta @paciente,22,@especialidade,@data,@motivo,@err
				IF(SELECT 1 FROM ListaDeEspera WHERE medico = @medico AND paciente = @paciente AND data = @data AND especialidade = @especialidade) = 1
					DELETE FROM ListaDeEspera WHERE medico = @medico AND paciente = @paciente AND data = @data AND especialidade = @especialidade
			END	