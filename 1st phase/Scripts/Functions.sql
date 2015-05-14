---- VERIFICAR QUE MÉDICO NÃO É O PACIENTE ----
CREATE FUNCTION MedicoNotPaciente(
@paciente int, @medico int)
RETURNS BIT
AS
BEGIN
--DECLARE @count int - possibilidade
	RETURN (SELECT 1 FROM Medico INNER JOIN Paciente ON (Medico.pessoa = Paciente.pessoa) 
	WHERE Medico.licencaMedica = @medico AND Paciente.numeroBenefeciario = @paciente)
END

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
			WHERE	Paciente.numeroBenefeciario = 3 
					AND Fatura.estado = 'emitida'
			)
END