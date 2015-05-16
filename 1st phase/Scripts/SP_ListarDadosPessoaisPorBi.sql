if OBJECT_ID('ListarDadosPessoais') is not null 
DROP PROC ListarListarDadosPessoaisDadosMedico

GO

CREATE PROC ListarDadosPessoais
@bi int
AS
BEGIN

-- LISTAR DADOS PESSOAIS DO PACIENTE x
	SELECT Pessoa.bi, Pessoa.nome, Pessoa.ultimoNome, Pessoa.dataNascimento, Pessoa.email, Pessoa.nacionalidade,
		   Pessoa.nif, Pessoa.numeroSS
				FROM Pessoa
			WHERE Pessoa.bi = @bi

-- LISTAR MORADAS DO PACIENTE x
	SELECT Morada.rua, Morada.numero, Morada.codigoPostal, Morada.cidade, Morada.pais, Morada.tipo
		FROM Morada
		WHERE Morada.pessoa = @bi

-- LISTAR TELEFONES DO PACIENTE x
	SELECT Telefone.numero, Telefone.tipo
		FROM Telefone
		WHERE Telefone.pessoa = @bi
END