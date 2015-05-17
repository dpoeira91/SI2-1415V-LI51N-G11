IF OBJECT_ID('InsereItemFatura') is not null
DROP PROC InsereItemFatura

GO
CREATE PROC InsereItemFatura @idFatura int, @montante decimal(10,2), @descricao nvarchar(1000)
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
		INSERT INTO ItemFatura(idFatura,numero,descricao,montante) 
		values (@idFatura,
			   (SELECT numero FROM ItemFatura 
			    WHERE idFatura = @idFatura AND ano = Year(getDate()))+1,
				@descricao,
				@montante)
	COMMIT
END
GO