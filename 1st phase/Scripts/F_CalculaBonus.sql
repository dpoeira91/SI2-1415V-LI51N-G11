use clinica
IF OBJECT_ID('CalculaBonus') is not null
DROP FUNCTION CalculaBonus
GO
CREATE FUNCTION CalculaBonus (@nif int)
RETURNS DECIMAL(3,2)
AS
BEGIN
	DECLARE @bonus int
	SELECT @bonus = Paciente.bonus 
	FROM  Pessoa	INNER JOIN Paciente ON(Bi = Pessoa) 
	WHERE Nif = @nif AND temDesconto = 1
	if(@bonus >= 0)
	BEGIN
		RETURN CAST((@bonus/100)/100 AS DECIMAL(3,2))
	END
	RETURN 1
END
GO
