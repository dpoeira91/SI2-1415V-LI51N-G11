use clinica
if(OBJECT_ID('ListaConsultasDia')!=null)
	DROP FUNCTION ListaConsultasDia
GO
CREATE FUNCTION ListaConsultasDia(@medico int, @dia date)
RETURNS TABLE
AS RETURN SELECT nome , motivo 
FROM Consulta INNER JOIN Paciente 
				ON (Consulta.pacienteConsulta = Paciente.numeroBenefeciario)
	 INNER JOIN Pessoa ON (Paciente.pessoa = Pessoa.bi)
	 WHERE medicoConsulta = @medico AND data = @dia
GO
--TESTES
SELECT * FROM ListaConsultasDia(11,'2015-02-11')