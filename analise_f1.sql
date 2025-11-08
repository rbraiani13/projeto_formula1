-- ####################################################################
-- PROJETO 3: ANÁLISE DE DADOS DA FÓRMULA 1 (DATASET ERGAST)
-- ####################################################################

-- Consultas Básicas (Exploração de Dados):

-- CB 1: Quantos pilotos de cada nacionalidade existem?
SELECT nationality, COUNT(*) AS total_pilotos FROM drivers GROUP BY nationality ORDER BY total_pilotos DESC LIMIT 10;

-- CB 2: Quais equipes (construtoras) são britânicas?
SELECT name, nationality FROM constructors WHERE nationality = 'British';

-- CB 3: Quantas corridas aconteceram em cada ano?
SELECT year, COUNT(*) AS total_corridas FROM races GROUP BY year ORDER BY year DESC;

-- CB 4: Quais pilotos têm o sobrenome "Senna"?
SELECT forename, surname, dob FROM drivers WHERE surname = 'Senna';

-- CB 5: Quais são todos os status de final de corrida (ex: "Finished", "Collision")?
SELECT DISTINCT status FROM status;


-- Consultas Intermediárias (Análise com JOINs e Agregação):

-- CI 1: Quem ganhou o "Bahrain Grand Prix" de 2023? (CORRIGIDA para tratar o '\N' no campo position)
SELECT
    t3.forename,
    t3.surname,
    t2.name AS nome_equipe
FROM
    results AS t1
JOIN
    constructors AS t2 ON t1.constructorId = t2.constructorId
JOIN
    drivers AS t3 ON t1.driverId = t3.driverId
JOIN
    races AS t4 ON t1.raceId = t4.raceId
WHERE
    t4.name = 'Bahrain Grand Prix' AND 
    t4.year = 2023 AND 
    t1.position != '\N' AND 
    CAST(t1.position AS INTEGER) = 1;

-- CI 2: Quantos pontos cada equipe marcou na temporada de 2023?
SELECT
    t2.name AS nome_equipe,
    SUM(t1.points) AS total_pontos_temporada
FROM
    results AS t1
JOIN
    constructors AS t2 ON t1.constructorId = t2.constructorId
JOIN
    races AS t3 ON t1.raceId = t3.raceId
WHERE
    t3.year = 2023
GROUP BY
    nome_equipe
ORDER BY
    total_pontos_temporada DESC;

-- CI 3: Quais os 5 motivos mais comuns para um piloto NÃO terminar uma corrida (DNF)?
SELECT
    t2.status,
    COUNT(*) AS total_ocorrencias
FROM
    results AS t1
JOIN
    status AS t2 ON t1.statusId = t2.statusId
WHERE
    t2.status NOT IN ('Finished', '+1 Lap', '+2 Laps', '+3 Laps', '+4 Laps', '+5 Laps', '+6 Laps', '+7 Laps', '+8 Laps', '+9 Laps', '+10 Laps', 'Disqualified')
GROUP BY
    t2.status
ORDER BY
    total_ocorrencias DESC
LIMIT 5;

-- FIM DO ARQUIVO .SQL