if OBJECT_ID('MedicoNotPaciente') is not null 
DROP FUNCTION MarcarConsulta

GO
---- VERIFICAR QUE MÉDICO NÃO É O PACIENTE ----
CREATE FUNCTION MedicoNotPaciente(
@paciente int, @medico int)
RETURNS BIT
AS
BEGIN
--DECLARE @count int - possibilidade
	RETURN (SELECT 1 FROM Medico INNER JOIN Paciente ON (Medico.pessoa = Paciente.pessoa) 
	WHERE Medico.licencaMedica = @medico AND Paciente.numeroBenefeciario = @paciente)
END

GO
