use clinica
DROP TRIGGER IN_DEBT;
GO
CREATE TRIGGER IN_DEBT
ON Consulta
INSTEAD OF INSERT
AS
	DECLARE @Count int
	DECLARE @NIFPaciente int

	SELECT @NIFPaciente = Pessoa.NIF FROM inserted INNER JOIN Pessoa ON (inserted.PacienteConsulta = Pessoa.Bi)

	SELECT @Count = COUNT(IdFatura) FROM Fatura
	WHERE Nif = @NIFPaciente AND Estado = 'emitida'

	IF(@Count>5)
		PRINT ('O Paciente com o NIF ' + cast(@NIFPaciente as nvarchar(20)) + ' tem mais de 5 faturas por pagar!\n Pague as dividas antes de marcar uma nova consulta.')	
	Else
		INSERT INTO Consulta (IdConsulta,Motivo,Data,DataRegisto,PacienteConsulta,MedicoConsulta,EspecialidadeConsulta) 
		SELECT IdConsulta,Motivo,Data,DataRegisto,PacienteConsulta,MedicoConsulta,EspecialidadeConsulta FROM inserted
GO

CREATE TRIGGER FATURA_TOTAL
ON ItemFatura
AFTER INSERT , UPDATE , DELETE 
AS
	
GO
