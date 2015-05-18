IF OBJECT_ID('ConcatenaMorada') is not null
DROP FUNCTION ConcatenaMorada

GO 

CREATE FUNCTION ConcatenaMorada (@bi int)
RETURNS NVARCHAR
AS BEGIN
DECLARE @atipo nvarchar(1000),
@atitulo nvarchar(1000),
@adesig nvarchar(1000),
@ainfo nvarchar(1000),
@nomeloc nvarchar(1000),
@cod int,
@ext int,
@freg nvarchar(1000),
@morada nvarchar(4000)

SELECT 
@atipo = arteria_tipo ,@atitulo = arteria_Titulo , @adesig = arteria_designacao,
@ainfo = arteria_info,@nomeloc = Nome_localidade , @cod = n_cod_postal,
@ext = extensao_n_do_cod_postal ,@freg = designacao_postal 
FROM CTT.dbo.CodigoPostal INNER JOIN Morada ON (id = idCtt) 
WHERE pessoa = @bi AND ordem = 1

IF @atipo is not null
	SET @morada = @atipo
IF @atitulo is not null
	SET @morada += ' '+@atitulo
IF @adesig is not null
	SET @morada += ' '+@adesig
IF @ainfo is not null
	SET @morada += ', '+@ainfo
SET @morada += ' '+cast(@cod as nvarchar(1000)) + '-' + cast(@ext as nvarchar(1000))
IF @nomeloc is not null
	SET @morada += ', '+@nomeloc
IF @freg is not null
	SET @morada += ', '+@freg
RETURN @morada
END