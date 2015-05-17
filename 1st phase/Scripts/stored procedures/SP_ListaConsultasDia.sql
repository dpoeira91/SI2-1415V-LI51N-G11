use clinica
if(OBJECT_ID('ListaConsultasDia')!=null)
	DROP PROC ListaConsultasDia
GO
CREATE PROC ListaConsultasDia @medico int, @dia date
AS
BEGIN
SELECT nome , motivo 
FROM Consulta INNER JOIN Paciente 
				ON (Consulta.pacienteConsulta = Paciente.numeroBenefeciario)
	 INNER JOIN Pessoa ON (Paciente.pessoa = Pessoa.bi)
	 WHERE medicoConsulta = @medico AND data = @dia
END
GO
--TESTES
/*
EXEC ListaConsultasDia 22,'2015-05-13'
*/