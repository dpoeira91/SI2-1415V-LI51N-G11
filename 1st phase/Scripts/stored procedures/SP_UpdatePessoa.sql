if OBJECT_ID('UpdatePessoa') is not null 
DROP PROC UpdatePessoa

GO

CREATE PROC UpdatePessoa
@bi int, @nif int, @nome nvarchar(15), @ultimoNome nvarchar(10), @nacionalidade nvarchar(20), 
@dataNascimento date, @email nvarchar(25)
AS
BEGIN
	UPDATE Pessoa
	SET
		Pessoa.dataNascimento = @dataNascimento,
		Pessoa.email = @email,
		Pessoa.nacionalidade = @nacionalidade,
		Pessoa.nif = @nif,
		Pessoa.nome = @nome,
		Pessoa.ultimoNome = @ultimoNome
	WHERE 
		Pessoa.bi = @bi 
END

--- TESTES ----
/*
EXEC UpdatePessoa 1,1,'Margarida','Sequeira','Portuguesa','1990-09-24','ola'
*/