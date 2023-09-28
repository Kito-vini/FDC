select
    NF.dataemissao AS DATA_EMISSAO,
    NF.datasaida AS DATA_SAIDA,
    NF.numeronf AS NOTA,
    NF.destinatario_razaosocial AS DESTINATARIO,
    NF.valortotalnf AS VALOR_NF,
    NF.baseicms AS BASE_CALCULO,
    SUM(NF.valoricms + NF.FCPVALOR) AS ICMS
from lfnf nf
inner join saida s on nf.numeroorigem = s.numerosaida
where s.tiposaida = '2' AND NF.status ='A' AND NF.tipolf='S' AND NF.modelo='55'
GROUP BY 1,2,3,4,5,6

--FILTROS:
-- E.IDFILIAL = SELECT IDFILIAL, NOMEFILIAL FROM FILIAL = {@SELECT_LISTA} /*FILIAL*/
-- NF.DATAEMISSAO = {@DATA_PERIODO} /*DATA*/