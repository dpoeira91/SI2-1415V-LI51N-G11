if OBJECT_ID('UpdateConsultaDoPaciente') is not null 
DROP PROC UpdateConsultaDoPaciente

GO

CREATE PROC UpdateConsultaDoPaciente
@motivo nvarchar(30), @data date, @pacienteConsulta int, @medicoConsulta int, @especialidadeConsulta int, @idConsulta int
AS
BEGIN TRY
		UPDATE Consulta
		SET
			data = @data,
			medicoConsulta = @medicoConsulta,
			especialidadeConsulta = @especialidadeConsulta,
			motivo = @motivo
		WHERE 
			pacienteConsulta = @pacienteConsulta AND idConsulta = @idConsulta
END TRY
BEGIN CATCH
	declare @e smallint, @state smallint, @message nvarchar(1000)
	SELECT 
		@state = ERROR_STATE()
        ,@message = ERROR_MESSAGE();

	THROW 51000, @message, @state;
END CATCH

-- EXEC UpdateConsultaDoPaciente 'inicial', '2015-05-16', 2,  33, 2, 4 