if OBJECT_ID('ListarMedicos') is not null 
DROP PROC ListarMedicos

GO

CREATE PROC ListarMedicos
AS
BEGIN
	SELECT Medico.pessoa, Medico.licencaMedica, Medico.dataLicenca, Medico.numeroPacientesDiario, Medico.numeroListadeEspera
	FROM Medico
END

-- EXEC ListarMedicos