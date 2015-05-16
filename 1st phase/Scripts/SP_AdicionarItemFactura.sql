use clinica
GO

CREATE PROC AdicionarItemFactura
@fatura int, @descrição nvarchar, @montante decimal
AS
BEGIN
	INSERT INTO ItemFatura(idFatura, descricao,montante) values(@fatura,@descrição,@montante)
	PRINT ('ItemFatura criado com sucesso!')
END