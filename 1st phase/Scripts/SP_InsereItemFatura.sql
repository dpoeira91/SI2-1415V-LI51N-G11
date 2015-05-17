IF OBJECT_ID('InsereItemFatura') is not null
DROP PROC InsereItemFatura

GO
CREATE PROC InsereItemFatura @idFatura int, @montante decimal(10,2), @descricao nvarchar(1000)
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
		DECLARE @num int
		SELECT @num = numero FROM ItemFatura 
			    WHERE idFatura = @idFatura AND ano = Year(getDate())
		IF @num IS NULL
			SET @num = 0
		INSERT INTO ItemFatura(idFatura,numero,descricao,montante) 
		values (@idFatura,
				@num +1,
				@descricao,
				@montante)
	COMMIT
END
GO

--- TESTES ---
/*
EXEC InsereItemFatura 3 , 12.0 , 'chicla'
*/