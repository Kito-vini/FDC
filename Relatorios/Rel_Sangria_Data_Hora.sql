SELECT
MOVCAIXA.IDFILIAL AS FILIAL,
MOVCAIXA.DATAMOV AS DATA,
MOVCAIXA.HORA AS HORA,
MOVCAIXA.IDFUNCIONARIO, FUNCIONARIO.NOMEFUNCIONARIO AS FUNCIONARIO,
MOVCAIXA.DESCRICAO AS DESCRICAO,
CAST(SUM(MOVCAIXA.VALOR) AS NUMERIC(15,2))  AS SANGRIA
FROM MOVCAIXA
JOIN FUNCIONARIO ON (FUNCIONARIO.IDFUNCIONARIO = MOVCAIXA.IDFUNCIONARIO)
JOIN FILIAL ON (MOVCAIXA.IDFILIAL = FILIAL.IDFILIAL)
WHERE MOVCAIXA.IDCONTA = '3.00.00.03'
GROUP BY MOVCAIXA.IDFILIAL, DATA, HORA, MOVCAIXA.IDFUNCIONARIO, FUNCIONARIO.NOMEFUNCIONARIO, DESCRICAO  
ORDER BY 2

/* Filtros:
    MOVCAIXA.IDFILIAL = {@BANCO_FILIAIS_ATIVAS} /*FILIAL*/
/*   MOVCAIXA.DATAMOV = {@DATA_PERIODO} /*DATA*/

