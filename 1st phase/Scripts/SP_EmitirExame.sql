IF OBJECT_ID('EmitirExame') is not null
DROP PROC EmitirExame

GO

CREATE PROC EmitirExame @idRelatorio int out, @data date, @descricao nvarchar(2000), @idEquipamento int, @notas nvarchar(2000), @resultado xml, @consulta int
AS
BEGIN
	BEGIN TRAN
	INSERT INTO Relatorio(data,descricao,consulta) values(@data,@descricao,@consulta)
	SET @idRelatorio = SCOPE_IDENTITY()
	INSERT INTO RelatorioExame(idRelatorio,idEquipamento,notas,resultado)
	VALUES (@idRelatorio,@idEquipamento,@notas,@resultado)
	COMMIT
END
GO

