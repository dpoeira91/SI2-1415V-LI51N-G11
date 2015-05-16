if OBJECT_ID('DeleteEspecialidadeDoMedico') is not null 
DROP PROC DeleteEspecialidadeDoMedico

GO

CREATE PROC DeleteEspecialidadeDoMedico
@licenca int, @idEspecialidade int
AS
BEGIN
	DELETE FROM MedicoEspecialidade
	WHERE	
		licenca = @licenca AND idEspecialidade = @idEspecialidade
END

-- EXEC DeleteEspecialidadeDoMedico 11, 1