use clinica
GO
IF OBJECT_ID('PassarFatura') is not null
DROP PROC PassarFatura 
GO

CREATE PROC PassarFatura
@nome nvarchar(1000), @nif int
AS
BEGIN
	IF(dbo.VerificarPessoa(@nif, @nome) = 1)
	BEGIN
		DECLARE @morada nvarchar(1617)
		SELECT @morada = (Convert(nvarchar(1000),rua)+' '+Convert(nvarchar(9),numero)+' '+Convert(nvarchar(8),codigoPostal)+' '+Convert(nvarchar(300),cidade)+' '+Convert(nvarchar(300),pais))
		FROM Morada
		WHERE pessoa = (SELECT bi FROM Pessoa WHERE nif = @nif AND nome = @nome) AND ordem =1

		INSERT INTO Fatura(idFatura,nome,nif, morada, estado) values(NEXT VALUE FOR FacturaID,@nome,@nif,@morada,'emProcessamento')
		PRINT ('Fatura criada com sucesso!')
	END
	ELSE
	BEGIN
		PRINT ('Fatura não foi criada com sucesso, verifique os dados do paciente!')
	END
END

--- TESTES ---
/*
EXEC PassarFatura 'Ana', 1
*/