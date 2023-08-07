SELECT 
       E.idproduto as codigo,
       P.descricaoproduto AS NOME,
       SUM(CASE WHEN e.IDFILIAL = '02' THEN e.qtder ELSE 0 END) AS Olinda,
       SUM(CASE WHEN e.IDFILIAL = '03' THEN e.qtder ELSE 0 END) AS Ufinha,
       SUM(CASE WHEN e.IDFILIAL = '04' THEN e.qtder ELSE 0 END) AS Taquara,
       SUM(CASE WHEN e.IDFILIAL = '05' THEN e.qtder ELSE 0 END) AS Campo_Grande,
       SUM(CASE WHEN e.IDFILIAL = '06' THEN e.qtder ELSE 0 END) AS Quintino,
       SUM(CASE WHEN e.IDFILIAL = '07' THEN e.qtder ELSE 0 END) AS Penha
FROM estoque E
inner join produto P
on e.idproduto = p.idproduto
GROUP BY E.idproduto,  P.DESCRICAOPRODUTO;

-- Filtros
-- P.IDGRUPO = SELECT IDGRUPO, NOMEGRUPO FROM GRUPO = {@SELECT_LISTA} /*SEÇÃO*/
-- P.IDDEPARTAMENTO = SELECT IDDEPARTAMENTO, NOMEDEPARTAMENTO FROM DEPARTAMENTO = {@SELECT_LISTA} /*DEPARTAMENTO*/
