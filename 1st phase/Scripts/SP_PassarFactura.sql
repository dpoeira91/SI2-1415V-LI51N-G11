CREATE PROC PassarFatura ----- 
@ano int, @nome nvarchar(1250), @nif int, @montante decimal(10,2)
AS
BEGIN
	IF(dbo.VerificarPessoa(@nif, @nome) = 1)
	return
END