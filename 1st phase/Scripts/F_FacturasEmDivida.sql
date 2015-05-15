if OBJECT_ID('FaturasEmDivida') is not null
DROP FUNCTION FaturasEmDivida

GO
---- VERIFICAR FACTURAS POR PAGAR ----
CREATE FUNCTION FaturasEmDivida(@paciente int)
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(Fatura.idFatura) 
			FROM Pessoa 
				INNER JOIN Paciente 
				ON(Pessoa.bi = Paciente.pessoa) 
				INNER JOIN Fatura 
				ON(Fatura.nif = Pessoa.nif)
			WHERE	Paciente.numeroBenefeciario = @paciente 
					AND Fatura.estado = 'emitida'
			)
END