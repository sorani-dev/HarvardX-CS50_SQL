-- In 13.sql, write a SQL query to explore a question of your choice. This query should:
--    Involve at least one condition, using WHERE with AND or OR
SELECT id,
    season,
    episode_in_season,
    title,
    topic,
    air_date,
    production_code
FROM episodes
WHERE air_date LIKE "____-01-__"
    AND season = 1;
