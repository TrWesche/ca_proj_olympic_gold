-- SQLite Syntax Used

-- Function: goldMedalNumber
SELECT COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States';

-- Function: mostSummerWins
SELECT year, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States' AND season = 'Summer'
GROUP BY year, country
ORDER BY count DESC
LIMIT 1;

-- Function: mostWinterWins
SELECT year, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States' AND season = 'Winter'
GROUP BY year, country
ORDER BY count DESC
LIMIT 1;

-- Function: bestYear
SELECT year, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States'
GROUP BY year, country
ORDER BY count DESC
LIMIT 1;

-- Function: bestDiscipline
SELECT discipline, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States'
GROUP BY discipline
ORDER BY count DESC
LIMIT 1;

-- Function: bestSport
SELECT sport, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States'
GROUP BY sport
ORDER BY count DESC
LIMIT 1;

-- Function: bestEvent
SELECT event, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States'
GROUP BY event
ORDER BY count DESC
LIMIT 1;

-- Function: numberMenMedalists
SELECT COUNT(DISTINCT name) AS count
FROM GoldMedal
WHERE country = 'United States' AND gender = 'Men';

-- Function: numberWomenMedalists
SELECT COUNT(DISTINCT name) AS count
FROM GoldMedal
WHERE country = 'United States' AND gender = 'Women';

-- Function: mostMedaledAthlete
SELECT name, COUNT(*) AS count
FROM GoldMedal
WHERE country = 'United States'
GROUP BY name
ORDER BY count DESC
LIMIT 1;

-- Function: orderedMedals
SELECT *
FROM GoldMedal
WHERE country = 'United States';

SELECT *
FROM GoldMedal
WHERE country = 'United States'
ORDER BY name ASC;


-- Function: orderedSports
WITH total_medals AS (
    SELECT COUNT(*) AS total_count
    FROM GoldMedal
    WHERE country = 'United States'
),
medal_per_sport AS (
    SELECT sport, COUNT(*) AS count
    FROM GoldMedal
    GROUP BY sport
    HAVING country = 'United States' AND count IS NOT NULL
)
SELECT sport, count, total_count, (count * 100 / total_count) 'percent'
FROM medal_per_sport
CROSS JOIN total_medals;
