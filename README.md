# Banco de Dados — Monitoramento de Indicadores Municipais de Saneamento

Projeto desenvolvido para a disciplina de Banco de Dados, com o objetivo de aplicar conceitos de modelagem entidade-relacionamento, criação e povoamento de tabelas e consultas SQL.

## 📌 Tema

### Sistema de Monitoramento de Indicadores Municipais de Saneamento

O banco de dados representa, de forma simplificada, um sistema de monitoramento de saneamento básico em diferentes municípios.

O sistema permite cadastrar municípios, sistemas de saneamento, indicadores e medições realizadas ao longo dos anos, possibilitando a geração de relatórios para análise da situação dos serviços de saneamento.

---

## 🌎 Mini-mundo

O banco considera que um município pode ser atendido por **zero ou vários sistemas de saneamento**, enquanto um sistema de saneamento pode atender **um ou vários municípios**.

Os sistemas de saneamento podem representar, por exemplo:

- Sistemas de Abastecimento de Água (SAA);
- Sistemas de Esgotamento Sanitário (SES).

Cada sistema de saneamento pode registrar **zero ou várias medições**.

Cada medição está associada a **um único sistema de saneamento** e a **um único indicador**.

Um indicador pode estar associado a **zero ou várias medições**, permitindo acompanhar sua evolução ao longo dos anos.

Dessa forma, o banco permite responder questões como:

- Quais municípios possuem sistemas de saneamento cadastrados?
- Quais municípios não possuem sistemas associados?
- Quantos sistemas existem por município?
- Quais indicadores apresentam os maiores valores?
- Como os indicadores evoluem ao longo dos anos?
- Quais sistemas apresentam resultados acima da média?
- Quais indicadores ainda não possuem medições cadastradas?

---

## 🗂️ Modelo Entidade-Relacionamento

O modelo foi desenvolvido utilizando o **brModelo**.

![Diagrama ER](modelo/Modelo%20DER.png)

### Principais relacionamentos

- **Município × Sistema de Saneamento:** relação N:N;
- **Sistema de Saneamento × Medição:** relação 1:N;
- **Indicador × Medição:** relação 1:N.

A relação N:N entre município e sistema de saneamento é representada, no modelo relacional, pela tabela associativa `municipio_sistema`.

---

## 🏗️ Estrutura do Banco

O banco de dados é composto por cinco tabelas:

### `municipio`

Armazena informações dos municípios analisados.

Principais atributos:

- `id_municipio`
- `nome`
- `uf`
- `latitude`
- `longitude`
- `populacao`

### `sist_saneamento`

Armazena os sistemas de saneamento existentes.

Principais atributos:

- `id_sistema`
- `nome`
- `tipo_sistema`
- `ano_implantacao`

### `municipio_sistema`

Tabela associativa responsável por representar a relação N:N entre municípios e sistemas de saneamento.

Principais atributos:

- `id_municipio`
- `id_sistema`

### `indicador`

Armazena os indicadores utilizados para avaliar os sistemas de saneamento.

Exemplos:

- Cobertura de abastecimento de água;
- Índice de perdas de água;
- Cobertura de esgotamento sanitário;
- População atendida;
- Extensão da rede;
- Volume tratado.

Principais atributos:

- `id_indicador`
- `nome`
- `descricao`
- `unidade`

### `medicao`

Armazena os valores dos indicadores registrados para cada sistema ao longo dos anos.

Principais atributos:

- `id_medicao`
- `id_sistema`
- `id_indicador`
- `ano_medicao`
- `valor`

---

## 📁 Organização do Projeto

```text
projeto-banco-saneamento/
│
├── README.md
│
├── modelo/
│   └── DER.png
│
└── sql/
    ├── 01_criacao.sql
    ├── 02_povoamento.sql
    └── 03_consultas.sql
