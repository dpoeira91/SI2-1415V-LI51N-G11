use clinica
if OBJECT_ID('UpdateMedico') is not null 
DROP PROC UpdateMedico

GO

CREATE PROC UpdateMedico
@licenca nvarchar(20), @dataLicenca date, @numPacientesDiario int, @numPacientesFilaEspera int
AS
BEGIN
	UPDATE Medico
	SET 
		dataLicenca = @dataLicenca,
		numeroPacientesDiario = @numPacientesDiario
	WHERE 
		licencaMedica = @licenca
END

---- TESTES ----
/*
EXEC UpdateMedico '11','1234-01-01',2,1
*/