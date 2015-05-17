if OBJECT_ID('ListaDeEsperaCheia') is not null
DROP FUNCTION ListaDeEsperaCheia

GO

CREATE FUNCTION ListaDeEsperaCheia(@medico int,@data date)
RETURNS BIT
AS
BEGIN
	IF ((SELECT COUNT(medico) FROM ListaDeEspera WHERE medico = @medico AND data = @data) < (SELECT limiteListaEspera FROM Meta))
		RETURN 0
	RETURN 1
END
GO