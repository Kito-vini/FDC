/*Relatório de entrada e saida com saldo de estoque por periodo*/

select p.idproduto codigo,
p.descricaoproduto nome,
sum(e.qtde) entrada,
sum(s.qtde) saida,
(sum(e.qtde)- sum(s.qtde)) saldo_de_estoque
from produto p
inner join itementrada e on p.idproduto = e.idproduto
inner join itemsaida s on p.idproduto = s.idproduto
where e.da between :data_inicial and :data_final
group by p.idproduto, p.descricaoproduto
order by p.descricaoproduto