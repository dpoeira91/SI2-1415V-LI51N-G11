if OBJECT_ID('UpdateMedicamentoDoPaciente') is not null 
DROP PROC UpdateMedicamentoDoPaciente

GO

CREATE PROC UpdateMedicamentoDoPaciente
@numBenefeciario int, @idMedicamento int, @posologia nvarchar(20)
AS
BEGIN TRY

	UPDATE MedicamentoPaciente
	SET	
		posologia = @posologia
	WHERE 
		MedicamentoPaciente.idMedicamento = @idMedicamento AND MedicamentoPaciente.idPaciente = @numBenefeciario
									
END TRY
BEGIN CATCH
	declare @e smallint, @state smallint, @message nvarchar(1000)
	SELECT 
		@state = ERROR_STATE()
        ,@message = ERROR_MESSAGE();

	THROW 51000, @message, @state;
END CATCH

-- EXEC UpdateMedicamentoDoPaciente 1, 1, 'manha'