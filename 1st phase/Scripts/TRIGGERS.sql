use clinica
DROP TRIGGER IN_DEBT;
GO
CREATE TRIGGER IN_DEBT
ON Consulta
INSTEAD OF INSERT
AS
	DECLARE @Count int
	DECLARE @NIFPaciente int

	SELECT @NIFPaciente = Pessoa.nif FROM inserted INNER JOIN Pessoa ON (inserted.pacienteConsulta = pessoa.bi)

	SELECT @Count = COUNT(idFatura) FROM Fatura
	WHERE nif = @NIFPaciente AND estado = 'emitida'

	IF(@Count>5)
		PRINT ('O Paciente com o NIF ' + cast(@NIFPaciente as nvarchar(20)) + ' tem mais de 5 faturas por pagar!\n Pague as dividas antes de marcar uma nova consulta.')	
	Else
		INSERT INTO Consulta (idConsulta,motivo,data,dataRegisto,pacienteConsulta,medicoConsulta,especialidadeConsulta) 
		SELECT idConsulta,motivo,data,dataRegisto,pacienteConsulta,medicoConsulta,especialidadeConsulta FROM inserted
GO

CREATE TRIGGER FATURA_TOTAL
ON ItemFatura
AFTER INSERT , UPDATE , DELETE 
AS
	
GO
