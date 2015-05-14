CREATE FUNCTION CalculaBonus (@nif int)
RETURNS DECIMAL(3,2)
AS
BEGIN
	DECLARE @bonus int
	SELECT @bonus = BonusPaciente.bonus 
	FROM  Pessoa	INNER JOIN Paciente ON(Bi = Pessoa) 
					INNER JOIN BonusPaciente ON(NumeroBenefeciario = Paciente)
	WHERE Nif = @nif AND temDesconto = 1
	if(
	RETURN 0
END
GO

DECLARE @bonus int
SELECT @bonus = Bi FROM Pessoa WHERE Bi = 2

print(@bonus = null)