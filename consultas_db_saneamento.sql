-- Liste os municípios com população superior a 100.000 habitantes, mostrando nome, 
-- UF e população, ordenados da maior para a menor população.

SELECT
    nome,
    uf,
    populacao
FROM municipio
WHERE populacao > 100000
ORDER BY populacao DESC;

-- Apresente a quantidade de municípios cadastrados em cada UF.

SELECT
    uf,
    COUNT(*) AS quantidade_municipios
FROM municipio
GROUP BY uf
ORDER BY quantidade_municipios DESC;

-- Liste os sistemas de saneamento implantados a partir de 2010, 
-- apresentando seu nome, tipo e ano de implantação.

SELECT
    nome,
    tipo_sistema,
    ano_implantacao
FROM sist_saneamento
WHERE ano_implantacao >= 2010
ORDER BY ano_implantacao;

-- Liste os municípios e os sistemas de saneamento que os atendem, 
-- mostrando o município, o tipo do sistema e o nome do sistema.

SELECT
    m.nome AS municipio,
    m.uf,
    s.nome AS sistema,
    s.tipo_sistema
FROM municipio m
JOIN municipio_sistema ms
    ON m.id_municipio = ms.id_municipio
JOIN sist_saneamento s
    ON ms.id_sistema = s.id_sistema
ORDER BY m.nome;

-- Calcule o valor médio registrado para cada indicador, 
-- considerando todas as medições disponíveis.

SELECT
    i.nome AS indicador,
    i.unidade,
    AVG(me.valor) AS media
FROM indicador i
JOIN medicao me
    ON i.id_indicador = me.id_indicador
GROUP BY
    i.id_indicador,
    i.nome,
    i.unidade
ORDER BY media DESC;

-- Identifique os sistemas de saneamento que possuem mais de uma medição 
-- cadastrada, mostrando a quantidade de medições de cada sistema.

SELECT
    s.nome AS sistema,
    COUNT(me.id_medicao) AS quantidade_medicoes
FROM sist_saneamento s
JOIN medicao me
    ON s.id_sistema = me.id_sistema
GROUP BY
    s.id_sistema,
    s.nome
HAVING COUNT(me.id_medicao) > 1
ORDER BY quantidade_medicoes DESC;

-- Liste todos os indicadores cadastrados que ainda não possuem nenhuma 
-- medição registrada, mostrando NULL para o valor da medição.

SELECT
    i.nome AS indicador,
    i.unidade,
    me.valor
FROM indicador i
LEFT JOIN medicao me
    ON i.id_indicador = me.id_indicador
WHERE me.id_medicao IS NULL;

-- Identifique os sistemas que apresentam cobertura de abastecimento de água 
-- superior à média geral desse indicador.

WITH media_cobertura AS (
    SELECT
        AVG(me.valor) AS media
    FROM medicao me
    JOIN indicador i
        ON me.id_indicador = i.id_indicador
    WHERE i.nome = 'Cobertura de abastecimento de água'
)

SELECT
    s.nome AS sistema,
    me.ano_medicao,
    me.valor,
    mc.media AS media_geral
FROM medicao me
JOIN sist_saneamento s
    ON me.id_sistema = s.id_sistema
JOIN indicador i
    ON me.id_indicador = i.id_indicador
CROSS JOIN media_cobertura mc
WHERE i.nome = 'Cobertura de abastecimento de água'
  AND me.valor > mc.media
ORDER BY me.valor DESC;

-- Crie um ranking dos sistemas de saneamento de acordo com a cobertura 
-- de abastecimento de água registrada em 2024, do maior para o menor valor.

SELECT
    s.nome AS sistema,
    me.valor AS cobertura_agua,
    RANK() OVER (
        ORDER BY me.valor DESC
    ) AS ranking
FROM medicao me
JOIN sist_saneamento s
    ON me.id_sistema = s.id_sistema
JOIN indicador i
    ON me.id_indicador = i.id_indicador
WHERE i.nome = 'Cobertura de abastecimento de água'
  AND me.ano_medicao = 2024
ORDER BY ranking;