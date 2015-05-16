if OBJECT_ID('InserirPaciente') is not null 
DROP PROC InserirPaciente

GO

CREATE PROC InserirMedico
@numeroBeneficiario int, @pessoa int, @sistemaSaude nvarchar(20)
AS
BEGIN
	IF(dbo.VerificarPessoaBi(@pessoa) = 1)
		INSERT INTO Paciente(pessoa, numeroBenefeciario, sistemaSaude)
		values(@pessoa, @numeroBeneficiario, @sistemaSaude) 
	ELSE
		PRINT('Não é possivel inserir o Paciente!') -- RAISEERROR
		return 
END

-- EXEC InserirPaciente 4444444, 4, 'medis'
-- EXEC InserirPaciente 5555555, 6, 'medis'
