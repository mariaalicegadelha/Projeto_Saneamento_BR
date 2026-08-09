INSERT INTO municipio
    (id_municipio, nome, uf, latitude, longitude, populacao)
VALUES
    (1, 'Castanhal',    'PA', -1.2965, -47.9211, 207000),
    (2, 'Bragança',     'PA', -1.0536, -46.7656, 130000),
    (3, 'Paragominas',  'PA', -2.9667, -47.4833, 115000),
    (4, 'Santarém',     'PA', -2.4431, -54.7083, 331000),
    (5, 'Marabá',       'PA', -5.3686, -49.1178, 290000),
    (6, 'Salinópolis',  'PA', -0.6136, -47.3561, 45000);


INSERT INTO sist_saneamento
    (id_sistema, nome, tipo_sistema, ano_implantacao)
VALUES
    (1, 'SAA Castanhal',       'SAA', 2005),
    (2, 'SES Castanhal',       'SES', 2012),
    (3, 'SAA Regional Nordeste','SAA', 2008),
    (4, 'SES Paragominas',     'SES', 2015),
    (5, 'SAA Santarém',        'SAA', 2003),
    (6, 'SES Marabá',          'SES', 2018);

INSERT INTO municipio_sistema
    (id_municipio, id_sistema)
VALUES
    (1, 1), -- Castanhal → SAA Castanhal
    (1, 2), -- Castanhal → SES Castanhal

    (2, 3), -- Bragança → SAA Regional Nordeste

    (3, 3), -- Paragominas → SAA Regional Nordeste
    (3, 4), -- Paragominas → SES Paragominas

    (4, 5), -- Santarém → SAA Santarém

    (5, 6); -- Marabá → SES Marabá


INSERT INTO indicador
    (id_indicador, nome, descricao, unidade)
VALUES
    (
        1,
        'Cobertura de abastecimento de água',
        'Percentual da população atendida pelo sistema de abastecimento de água',
        '%'
    ),
    (
        2,
        'Índice de perdas de água',
        'Percentual de água perdida durante o processo de distribuição',
        '%'
    ),
    (
        3,
        'Cobertura de esgotamento sanitário',
        'Percentual da população atendida pela rede de esgoto',
        '%'
    ),
    (
        4,
        'População atendida',
        'Quantidade de habitantes atendidos pelo sistema',
        'habitantes'
    ),
    (
        5,
        'Extensão da rede',
        'Extensão total da rede de saneamento',
        'km'
    ),
    (
        6,
        'Volume tratado',
        'Volume médio de água ou esgoto tratado pelo sistema',
        'm3/dia'
    );

INSERT INTO medicao
    (id_medicao, id_sistema, id_indicador, ano_medicao, valor)
VALUES
    (1, 1, 1, 2022, 91.50),
    (2, 1, 1, 2023, 93.20),
    (3, 1, 1, 2024, 94.80),

    (4, 1, 2, 2024, 36.40),

    (5, 2, 3, 2024, 68.70),

    (6, 2, 4, 2024, 142000),

    (7, 3, 1, 2024, 89.30),

    (8, 4, 3, 2024, 72.10),

    (9, 5, 1, 2024, 96.40),

    (10, 5, 2, 2024, 31.80),

    (11, 6, 3, 2024, 61.50);
