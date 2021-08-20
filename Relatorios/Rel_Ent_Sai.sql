/*Relatório de entrada e saida com saldo de estoque por periodo*/

select p.idproduto codigo,
p.descricaoproduto,
totent.compra as entrada,
totsa.venda as saida,
totent.compra - totsa.venda as saldo_de_estoque
from produto p
inner join (select sum(ent.qtde) as compra, ent.idproduto as cod from itementrada as ent
where ent.da between :data_inicial and :data_final
 group by ent.idproduto) as totent
on p.idproduto = totent.cod
inner join ( select sum(sa.qtde) as venda, sa.idproduto as cod from itemsaida as sa
where sa.da between :data_inicial and :data_final
 group by sa.idproduto) as totsa
on p.idproduto = totsa.cod
group by p.idproduto, p.descricaoproduto,totent.compra, totsa.venda
order by p.idproduto