---create database saneamento_br

CREATE TABLE municipio (
    id_municipio SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    uf CHAR(2) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    populacao INTEGER NOT NULL
);

CREATE TABLE sist_saneamento (
    id_sistema SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo_sistema VARCHAR(50) NOT NULL,
    ano_implantacao INTEGER
);

CREATE TABLE municipio_sistema (
    id_municipio INTEGER NOT NULL,
    id_sistema INTEGER NOT NULL,

    PRIMARY KEY (id_municipio, id_sistema),

    FOREIGN KEY (id_municipio)
        REFERENCES municipio(id_municipio),

    FOREIGN KEY (id_sistema)
        REFERENCES sist_saneamento(id_sistema)
);

CREATE TABLE indicador (
    id_indicador SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    unidade VARCHAR(50) NOT NULL
);

CREATE TABLE medicao (
    id_medicao SERIAL PRIMARY KEY,

    id_sistema INTEGER NOT NULL,
    id_indicador INTEGER NOT NULL,

    ano_medicao INTEGER NOT NULL,
    valor DECIMAL(15,2) NOT NULL,

    FOREIGN KEY (id_sistema)
        REFERENCES sist_saneamento(id_sistema),

    FOREIGN KEY (id_indicador)
        REFERENCES indicador(id_indicador)
);
