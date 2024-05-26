-- It’s a bit of a slow day in the office. Though Satchel no longer plays, 
-- in 5.sql, write a SQL query to find all teams that Satchel Paige played for.
--     Your query should return a table with a single column, one for the name of the teams.
SELECT DISTINCT teams.name
FROM teams
    INNER JOIN players p ON p.id = performances.player_id
    INNER JOIN performances ON performances.team_id = teams.id
WHERE p.first_name = "Satchel"
    AND p.last_name = "Paige";
