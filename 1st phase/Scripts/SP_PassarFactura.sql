CREATE PROC PassarFatura ----- 
@ano int, @nome nvarchar(1250), @nif int
AS
BEGIN
	IF(dbo.VerificarPessoa(@nif, @nome) = 1)
	BEGIN
		INSERT INTO Fatura(idFatura,ano,nome,nif) values(NEXT VALUE FOR FacturaID, @ano,@nome,@nif)
		PRINT ('Fatura criada com sucesso!')
		--reiniciar o id dos ItemFactura
		ALTER SEQUENCE ItemFacturaID
		RESTART WITH 1
		INCREMENT BY 1;
	END
	PRINT ('Fatura não foi criada com sucesso, verifique os dados do paciente!')
END