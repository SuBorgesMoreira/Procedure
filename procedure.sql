IF OBJECT_ID ('dbo.select_produtos_por_faixa_de_desconto') IS NOT NULL
DROP PROCEDURE dbo.select_produtos_por_faixa_de_desconto
GO
CREATE PROCEDURE dbo.select_produtos_por_faixa_de_desconto(
@desc_min as decimal(10,2),
@desc_max as decimal(10,2)
)
AS
BEGIN
select @desc_min as "Desconto Minimo", @desc_max as "Desconto Maximo"
END
GO
DECLARE @DescontoMinimo decimal(5,2);
DECLARE @MaximoDeDesconto decimal(5,2);
SET @DescontoMinimo = 10.5;
SET @MaximoDeDesconto = 20.5;
Exec dbo.select_produtos_por_faixa_de_desconto @DescontoMinimo,@MaximoDeDesconto
Exec dbo.select_produtos_por_faixa_de_desconto @desc_min=@DescontoMinimo,@desc_max=@MaximoDeDesconto


IF OBJECT_ID ('dbo.select_produtos_por_faixa_de_desconto') IS NOT NULL
DROP PROCEDURE dbo.aplica_desconto_no_preco
GO
CREATE PROCEDURE dbo.aplica_desconto_no_preco(
@pco as decimal(10,2),
@perc_de_desconto as decimal(10,2) = 0.0,
@pco_com_desconto as decimal(10,2) OUTPUT
)
AS
BEGIN
SELECT @pco_com_desconto = @pco - (@pco * @perc_de_desconto)
SELECT @pco_com_desconto as "Preco Com Desconto"
END
GO
DECLARE @Preco decimal(5,2);
DECLARE @PercentualDeDesconto decimal(5,2);
DECLARE @PrecoComDesconto decimal(5,2);
SET @Preco = 100;
SET @PercentualDeDesconto = 0.5;
Exec dbo.aplica_desconto_no_preco @Preco,@PercentualDeDesconto,@PrecoComDesconto output
SELECT @PrecoComDesconto AS "Vlr da Variavel @PrecoComDesconto"

/*Exec dbo.aplica_desconto_no_preco @PrecoComDesconto output, @pco = 1000,@perc_de_desconto = 0.5
SELECT @PrecoComDesconto AS "Again:Vlr da Variavel @PrecoComDesconto"*/