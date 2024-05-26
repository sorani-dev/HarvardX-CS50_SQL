-- You need to make a recommendation about which player (or players) to avoid recruiting. 
-- In 7.sql, write a SQL query to find the name of the player who’s been paid 
-- the highest salary, of all time, in Major League Baseball.
--     Your query should return a table with two columns, one for 
--         the player’s first name and one for their last name.
SELECT first_name,
    last_name
FROM (
        SELECT players.first_name,
            players.last_name,
            MAX(salaries.salary)
        FROM players
            INNER JOIN salaries ON salaries.player_id = players.id
    );
