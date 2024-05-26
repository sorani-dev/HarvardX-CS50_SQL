-- In 10.sql, write SQL query to answer 
-- a question of your choice. This query should:
--     Make use of AS to rename a column
--     Involve at least condition, using WHERE
--     Sort by at least one column using ORDER BY
SELECT DISTINCT first_name || " " || last_name AS "Full Name",
    bats,
    throws,
    weight,
    height
FROM players
WHERE height > (
        SELECT AVG(height) AS average_height
        FROM players
    )
    AND weight > (
        SELECT AVG(weight) AS average_weight
        FROM players
    )
ORDER BY last_name,
    first_name;
