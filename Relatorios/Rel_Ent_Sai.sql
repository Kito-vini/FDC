/*Relatório de entrada e saida com saldo de estoque por periodo*/

select p.idproduto codigo,
p.descricaoproduto nome,
(e.qtde) entrada,
sum(s.qtde) saida,
(e.qtde)- sum(s.qtde) saldo_de_estoque
from produto p
inner join itementrada e on p.idproduto = e.idproduto
inner join itemsaida s on p.idproduto = s.idproduto
where e.da between :data_inicial and :data_final
group by p.idproduto, p.descricaoproduto, e.qtde
order by p.descricaoproduto