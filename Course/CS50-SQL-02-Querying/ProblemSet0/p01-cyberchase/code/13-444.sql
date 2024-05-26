-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
--     Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.
SELECT air_date, id, *
FROM episodes
ORDER BY air_date ASC;
SELECT DISTINCT(season)
FROM episodes
ORDER BY season ASC;
SELECT DISTINCT strftime("%Y", air_date) AS year
FROM episodes;
SELECT *
FROM episodes
GROUP BY season, strftime("%Y", air_date)
ORDER BY air_date;

SELECT air_date, strftime("%M-%d", air_date)
FROM (SELECT DISTINCT strftime("%Y", air_date) AS year, air_date
FROM episodes)
ORDER BY air_date;

SELECT id, season, episode_in_season, title, topic, air_date, production_code
FROM episodes
WHERE season = 2
ORDER BY air_date
LIMIT 1;
