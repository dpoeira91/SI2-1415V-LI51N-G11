if OBJECT_ID('UpdateConsultaDoMedico') is not null 
DROP PROC UpdateConsultaDoMedico

GO

CREATE PROC UpdateConsultaDoMedico
@motivo nvarchar(30), @data date, @pacienteConsulta int, @medicoConsulta int, @especialidadeConsulta int, @idConsulta int
AS
BEGIN TRY
		UPDATE Consulta
		SET
			data = @data,
			pacienteConsulta = @pacienteConsulta,
			especialidadeConsulta = @especialidadeConsulta,
			motivo = @motivo
		WHERE 
			medicoConsulta = @medicoConsulta AND idConsulta = @idConsulta
END TRY
BEGIN CATCH
	declare @e smallint, @state smallint, @message nvarchar(1000)
	SELECT 
		@state = ERROR_STATE()
        ,@message = ERROR_MESSAGE();

	THROW 51000, @message, @state;
END CATCH

-- EXEC UpdateConsultaDoMedico 'inicial', '2015-05-16', 3,  33, 2, 4 