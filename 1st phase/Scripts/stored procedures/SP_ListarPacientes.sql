if OBJECT_ID('ListarPacientes') is not null 
DROP PROC ListarPacientes

GO

CREATE PROC ListarPacientes
AS
BEGIN
	SELECT Paciente.numeroBenefeciario, Paciente.pessoa, Paciente.sistemaSaude, Paciente.bonus FROM Paciente
END

-- EXEC ListarPacientes