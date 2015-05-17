if OBJECT_ID('DeleteMedicamentoDoPaciente') is not null 
DROP PROC DeleteMedicamentoDoPaciente

GO

CREATE PROC DeleteMedicamentoDoPaciente
@numBeneficiarioPaciente int, @idMedicamento int
AS
BEGIN
	DELETE FROM MedicamentoPaciente
	WHERE	
		idPaciente = @numBeneficiarioPaciente AND idMedicamento = @idMedicamento
END

-- EXeC DeleteMedicamentoDoPaciente 3, 3