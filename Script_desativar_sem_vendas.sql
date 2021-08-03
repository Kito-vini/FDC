/* script para desativar os produtos que não tiveram compra e venda*/

create view vw_inativos(idproduto) as

select p.idproduto from produto p
left join itemsaida s
on p.idproduto = s.idproduto
where not p.unidademedida='KG'
and p.ultimadataentrada is null
order by p.idproduto

commit

select idproduto from vw_inativos

commit

update produto set ativo='F'
where idproduto in (select * from vw_inativos)

commit