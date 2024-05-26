-- You need a player that can get hits. Who might be the most underrated? 
-- In 11.sql, write a SQL query to find the 10 least expensive players per hit in 2001.
--  *  You can calculate a player’s salary per hit by dividing their 2001 salary by the number of hits they made in 2001. Call the column “dollars per hit”.
--  *  As in 10.sql, ensure that the salary’s year and the performance’s year match.
--  *  Dividing a salary by 0 hits will result in a NULL value. Avoid the issue by filtering out players with 0 hits.
--  *  Sort the table by the “dollars per hit” column, least to most expensive. If two players have the same “dollars per hit”, order by first name, followed by last name, in alphabetical order.
--  *  Your query should return a table with three columns, one for the players’ first names, one of their last names, and one called “dollars per hit”.
--  *  You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
SELECT players.first_name,
    players.last_name,
    salaries.salary / performances.H AS "dollars per hit"
FROM players
    INNER JOIN salaries ON salaries.player_id = players.id
    INNER JOIN performances ON performances.player_id = players.id
WHERE salaries.year = 2001
    AND performances.H != 0
    AND performances.year = 2001
ORDER BY 3,
    1,
    2
LIMIT 10;
