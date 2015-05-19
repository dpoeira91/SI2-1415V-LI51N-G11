use clinica
IF OBJECT_ID('AdicionaMorada') is not null
DROP PROC AdicionaMorada

GO
CREATE PROC AdicionaMorada @pessoa int, @codPostal int,@exten int, @ordem int,@tipo int
AS
BEGIN
	declare @idCtt int
	SELECT @idCtt = id FROM CTT.dbo.CodigoPostal
	WHERE n_cod_postal = @codPostal AND extensao_n_do_cod_postal = @exten
	INSERT INTO Morada (pessoa,ordem,idCtt,tipo) values(@pessoa,@ordem,@idCtt,@tipo)
END

GO

---- TESTES ----
/*
EXEC AdicionaMorada 1,2680,404,1,1
SELECT * FROM CTT.dbo.CodigoPostal INNER JOIN Morada ON (id = idCtt)
*/
