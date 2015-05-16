if OBJECT_ID('UpdateEspecialidadeDoMedico') is not null 
DROP PROC UpdateEspecialidadeDoMedico

GO

CREATE PROC UpdateEspecialidadeDoMedico
@licenca int, @especialidade int
AS
BEGIN
	UPDATE MedicoEspecialidade
	SET 
		idEspecialidade = @especialidade
	WHERE 
		licenca = @licenca
END

-- EXeC UpdateEspecialidadeDoMedico 44, 1