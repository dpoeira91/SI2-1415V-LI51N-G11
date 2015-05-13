---- VERIFICAR QUE MÉDICO NÃO É O PACIENTE ----
CREATE FUNCTION MedicoNotPaciente(
@paciente int, @medico int)
RETURNS BIT
AS
BEGIN
--DECLARE @count int - possibilidade
	RETURN (SELECT 1 FROM Medico INNER JOIN Paciente ON (Medico.Pessoa = Paciente.Pessoa) 
	WHERE Medico.LicencaMedica = @medico AND Paciente.NumeroBenefeciario = @paciente)
END

GO

---- VERIFICAR FACTURAS POR PAGAR ----
CREATE FUNCTION FaturasEmDivida(@paciente int)
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(Fatura.IdFatura) 
			FROM Pessoa 
				INNER JOIN Paciente 
				ON(Pessoa.Bi = Paciente.Pessoa) 
				INNER JOIN Fatura 
				ON(Fatura.Nif = Pessoa.Nif)
			WHERE	Paciente.NumeroBenefeciario = 3 
					AND Fatura.Estado = 'emitida'
			)
END