-- In 4.sql, write a SQL query to find the lowest normal 
-- ocean surface temperature.
SELECT "0m"
FROM normals
WHERE "0m" IS NOT NULL
ORDER BY 1 ASC
LIMIT 1;
