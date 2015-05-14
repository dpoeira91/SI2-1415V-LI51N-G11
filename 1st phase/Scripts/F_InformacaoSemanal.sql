use clinica

IF OBJECT_ID ('InformacaoSemanal') is not null
DROP FUNCTION InformacaoSemanal

GO
CREATE FUNCTION InformacaoSemanal()
RETURNS @InfoSTable TABLE(
	consultas int ,
	lucroPrevisto DECIMAL
)
AS
BEGIN
DECLARE @count int 
DECLARE @total DECIMAL
SELECT @count = COUNT(idConsulta), @total = SUM(preco) FROM Consulta INNER JOIN Especialidade 
		ON(Consulta.especialidadeConsulta = Especialidade.idEspecialidade) 
WHERE data>CAST(GETDATE() AS DATE) AND data<CAST(DATEADD(d,7,GETDATE()) AS DATE)		
INSERT INTO @InfoSTable(consultas,lucroPrevisto) values(@count,@total + 40 * @count)
RETURN
END
GO
SELECT * FROM InformacaoSemanal()