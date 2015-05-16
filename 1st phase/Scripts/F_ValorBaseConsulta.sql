use clinica
IF OBJECT_ID('ValorBaseConsulta') is not null
DROP FUNCTION dbo.ValorBaseConsulta

GO 
CREATE FUNCTION ValorBaseConsulta()
RETURNS INT
AS
BEGIN
RETURN (SELECT montanteBase FROM Meta)
END
GO

print(dbo.ValorBaseConsulta())