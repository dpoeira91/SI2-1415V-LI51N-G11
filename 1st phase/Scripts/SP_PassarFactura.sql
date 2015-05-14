CREATE PROC PassarFatura ----- 
@ano int, @nome nvarchar(1250), @nif int
AS
BEGIN
	IF(dbo.VerificarPessoa(@nif, @nome) = 1)
	BEGIN
		INSERT INTO Fatura(Ano,Nome,Nif) values(@ano,@nome,@nif)
		PRINT ('Fatura criada com sucesso!')
	END
	PRINT ('Fatura não foi criada com sucesso, verifique os dados do paciente!')
END