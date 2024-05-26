-- DESE is preparing a report on schools in the city of Cambridge. 
-- In 7.sql, write a SQL query to find the names of schools 
-- (public or charter!) in the Cambridge school district.
SELECT schools.name
FROM schools
    INNER JOIN districts d ON d.id = schools.district_id
WHERE d.name = "Cambridge";
