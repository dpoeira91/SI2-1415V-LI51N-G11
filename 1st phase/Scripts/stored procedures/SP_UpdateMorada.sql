use clinica
if OBJECT_ID('UpdateMorada') is not null 
DROP PROC UpdateMorada

GO

CREATE PROC UpdateMorada
@pessoa int, @codPostal int,@exten int, @ordem int,@tipo int
AS
BEGIN
	declare @idCtt int
	SELECT @idCtt = id FROM CTT.dbo.CodigoPostal
	WHERE n_cod_postal = @codPostal AND extensao_n_do_cod_postal = @exten
	UPDATE Morada SET idCtt = @idCtt , tipo = @tipo

END

--- TESTES ----
/*
EXEC UpdateMorada 1, 2855 , 576 , 1 ,1
SELECT * FROM CTT.dbo.CodigoPostal INNER JOIN Morada ON (id = idCtt)
*/