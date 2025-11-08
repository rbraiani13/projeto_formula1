# Projeto SQL 3: Análise Histórica do Campeonato de F1 (Ergast DB)

## 🎯 Objetivo

Realizar uma análise histórica e estatística do Campeonato Mundial de Fórmula 1 (1950 - 2023) utilizando um banco de dados relacional de alta complexidade. Este projeto demonstra a proficiência em **JOINs** de múltiplas tabelas, **agregações** e tratamento de dados faltantes (`\N`).

## 📂 Dataset

Foi utilizado o **Ergast F1 Dataset**, importado de CSVs para 5 tabelas principais no PostgreSQL: `drivers`, `constructors`, `races`, `results`, e `status`.

---

## 🏁 Resultados de Análise

### 1. Consultas Intermediárias (Análise de Negócios)

#### CI 2: Quem dominou a temporada de 2023?

A consulta agregou os pontos totais para cada construtora na temporada de 2023, mostrando a diferença de desempenho entre as equipes.

| Nome da Equipe | Total de Pontos |
| :--- | :--- |
| **Red Bull** | **790** |
| Mercedes | 374 |
| Ferrari | 363 |
| McLaren | 266 |
| Aston Martin | 266 |

**Conclusão:** A Red Bull Racing dominou a temporada 2023 com mais que o dobro de pontos do segundo colocado (Mercedes), indicando uma superioridade técnica esmagadora.

*(Consulta SQL utilizada: [analise_f1.sql])*

#### CI 3: Quais as 5 maiores causas históricas de DNF (Abandono)?

A análise das razões de DNF (Did Not Finish) revelou as falhas mais comuns nos carros ao longo da história da F1, indicando problemas de engenharia recorrentes.

| Motivo de Abandono | Total de Ocorrências |
| :--- | :--- |
| **Engine** | **2026** |
| Accident | 1062 |
| Did not qualify | 1025 |
| Collision | 854 |
| Gearbox | 810 |

**Conclusão:** Falhas no **Motor** e na **Caixa de Câmbio** (Gearbox) são as causas mecânicas mais frequentes para abandonos, superando até mesmo os acidentes e colisões.

### 2. Consultas Básicas (Exemplos)

Este projeto também inclui consultas de exploração de dados, como:
* **Contagem de Pilotos por Nacionalidade:** Britânica (166), Americana (158), Italiana (99).
* **Identificação de Equipes:** Lista todas as construtoras com nacionalidade 'British' (ex: McLaren, Williams, BAR).
* **Busca de Piloto:** Localiza todos os pilotos com o sobrenome 'Senna'.

---

## ✅ Conclusão do Projeto

O projeto demonstrou a capacidade de:
1.  Modelar e importar dados de múltiplas fontes CSV para um banco de dados relacional.
2.  Utilizar `JOINs` complexos (quatro tabelas) e funções de agregação (`SUM`) para responder a perguntas de desempenho de negócios (ou esportivos).
3.  Tratar e limpar dados com formatos inconsistentes (utilizando filtros para `t1.position != '\N'`).
