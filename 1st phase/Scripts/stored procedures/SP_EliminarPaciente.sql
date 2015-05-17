use clinica

if OBJECT_ID('EliminarPaciente') is not null 
DROP PROC EliminarPaciente

GO

CREATE PROC EliminarPaciente @paciente int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	BEGIN TRAN
	--se o paciente tiver dividas nao pode ser apagado!!
	IF(dbo.FaturasEmDivida(@paciente) > 0)
	BEGIN
		PRINT('Paciente com dívidas! Pff Pague-as antes de voltar a tentar.')
	END
	ELSE
	BEGIN
		DECLARE @bi INT
		SELECT @bi=pessoa FROM Paciente WHERE numeroBenefeciario = @paciente

		INSERT INTO HistoricoPaciente (bi,nif,numeroSS,nome,ultimoNome,dataNascimento,nacionalidade,
		email,numeroBenefeciario,sistemaSaude,bonus)
		SELECT bi,nif,numeroSS,nome,ultimoNome,dataNascimento,nacionalidade,email,numeroBenefeciario,sistemaSaude,bonus
		FROM Pessoa INNER JOIN Paciente on(bi = pessoa)
		WHERE numeroBenefeciario = @paciente

		INSERT INTO HistoricoMedicamentoPaciente (idMedicamento,idPaciente,posologia)
		SELECT idMedicamento, idPaciente, posologia 
		FROM MedicamentoPaciente
		WHERE idPaciente = @paciente	

		INSERT INTO HistoricoConsulta (idConsulta,motivo,data,dataRegisto,pacienteConsulta,medicoConsulta,especialidadeConsulta)
		SELECT idConsulta,motivo,data,dataRegisto,pacienteConsulta,medicoConsulta,especialidadeConsulta 
		FROM Consulta
		WHERE pacienteConsulta = @paciente

		INSERT INTO HistoricoMorada (pessoa,ordem,rua,numero,codigoPostal,cidade,pais,tipo)
		SELECT pessoa,ordem,rua,numero,codigoPostal,cidade,pais,tipo
		FROM Morada
		WHERE pessoa = @bi

		INSERT INTO HistoricoTelefone (pessoa,ordem,numero,tipo)
		SELECT pessoa,ordem,numero,tipo
		FROM Telefone
		WHERE pessoa = @bi

		--Eliminar o Paciente da BD
		DELETE FROM MedicamentoPaciente
		WHERE idPaciente = @paciente

		DELETE FROM Consulta
		WHERE pacienteConsulta = @paciente

		DELETE FROM Paciente
		WHERE numeroBenefeciario = @paciente

		--Ver se o paciente tambem é medico, se não for apagar do resto das tabelas
		if(dbo.VerificarMedico(@bi) IS NULL)
			BEGIN
				DELETE FROM Morada
				WHERE pessoa = @bi

				DELETE FROM Telefone
				WHERE pessoa = @bi

				DELETE FROM Pessoa
				WHERE bi = @bi
			END

		PRINT('Paciente removido com sucesso!')
	END
	COMMIT
END
GO
--- TESTES ---
/*
EXEC EliminarPaciente 1
EXEC EliminarPaciente 2
EXEC EliminarPaciente 3

SELECT * FROM HistoricoPaciente
SELECT * FROM HistoricoMedicamentoPaciente
SELECT * FROM HistoricoConsulta
SELECT * FROM HistoricoMorada
SELECT * FROM HistoricoTelefone

select * from Paciente INNER JOIN Pessoa ON (pessoa = bi)
where numeroBenefeciario = 2
*/