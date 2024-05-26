-- Hits are great, but so are RBIs! In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
--     You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
--     Keep in mind the lessons you’ve learned in 10.sql and 11.sql!
--     Your query should return two columns, one for the players’ first names and one of their last names.
--     Order your results by player ID, least to greatest.
--     You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
SELECT players.first_name,
    players.last_name
FROM players
WHERE players.id IN (
        SELECT players.id
        FROM players
            INNER JOIN salaries ON salaries.player_id = players.id
            INNER JOIN performances ON performances.player_id = players.id
        WHERE salaries.year = 2001
            AND performances.H != 0
            AND performances.year = 2001
        ORDER BY salaries.salary / performances.H
        LIMIT 10
    )
    AND players.id IN (
        SELECT players.id
        FROM players
            INNER JOIN salaries ON salaries.player_id = players.id
            INNER JOIN performances ON performances.player_id = players.id
        WHERE salaries.year = 2001
            AND performances.RBI != 0
            AND performances.year = 2001
        ORDER BY salaries.salary / performances.RBI
        LIMIT 10
    )
ORDER BY players.id;
