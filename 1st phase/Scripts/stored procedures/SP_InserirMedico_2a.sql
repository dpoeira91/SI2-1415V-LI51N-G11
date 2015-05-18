use clinica
if OBJECT_ID('InserirMedico') is not null 
DROP PROC InserirMedico

GO

CREATE PROC InserirMedico
@pessoa int, @licencaMedica int, @dataLicenca date, @numeroPacientesDiario int, @idEspc int
AS
BEGIN
	IF(dbo.VerificarPessoaBi(@pessoa) != 1)
	BEGIN
		PRINT('Não é possivel inserir o Medico!') -- RAISEERROR
		return
	END
	IF(dbo.VerificarEspecialidade(@idEspc) != 1)
	BEGIN
		PRINT('A especialidade não existe!') -- RAISEERROR
		return
	END
	INSERT INTO Medico(pessoa, licencaMedica, dataLicenca, numeroPacientesDiario)
	values(@pessoa, @licencaMedica, @dataLicenca, @numeroPacientesDiario) 

	INSERT INTO MedicoEspecialidade(idEspecialidade, licenca)
	values(@idEspc, @licencaMedica)

END

-- EXEC InserirMedico 4, 4, '2015-02-15', 12, 10, 2