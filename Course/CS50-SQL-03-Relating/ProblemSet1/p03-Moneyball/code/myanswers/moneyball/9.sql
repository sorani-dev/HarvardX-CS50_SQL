-- What salaries are other teams paying? In 9.sql, 
-- write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.
--     Round the average salary column to two decimal places and call it “average salary”.
--     Sort the teams by average salary, least to greatest.
--     Your query should return a table with two columns, one for the teams’ names 
--         and one for their average salary.
-- SELECT teams.name, round(avg(salary), 2) AS "average salary", salaries.year
-- FROM teams
-- INNER JOIN salaries ON salaries.team_id = teams.id
-- ORDER BY 2 ;
-- SELECT teams.name, salaries.salary, salaries.year
-- FROM teams
-- INNER JOIN salaries ON salaries.team_id = teams.id
-- WHERE salaries.year = 2001;
SELECT "name",
    round(avg(salary), 2) AS "average salary"
FROM (
        SELECT teams.name,
            salaries.salary,
            salaries.year
        FROM teams
            INNER JOIN salaries ON salaries.team_id = teams.id
        WHERE salaries.year = 2001
    )
GROUP BY "name"
ORDER BY 2
LIMIT 5;
