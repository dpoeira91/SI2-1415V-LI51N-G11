use clinica
if OBJECT_ID('ListarDadosPessoais') is not null 
DROP PROC ListarDadosPessoais

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
	SELECT 
arteria_tipo ,arteria_Titulo , arteria_designacao,
arteria_info,Nome_localidade ,n_cod_postal,
extensao_n_do_cod_postal ,designacao_postal 
FROM CTT.dbo.CodigoPostal INNER JOIN Morada ON (id = idCtt) 
WHERE pessoa = @bi

-- LISTAR TELEFONES DO PACIENTE x
	SELECT Telefone.numero, Telefone.tipo
		FROM Telefone
		WHERE Telefone.pessoa = @bi
END

--- TESTE ---
/*
EXEC ListarDadosPessoais 1
*/