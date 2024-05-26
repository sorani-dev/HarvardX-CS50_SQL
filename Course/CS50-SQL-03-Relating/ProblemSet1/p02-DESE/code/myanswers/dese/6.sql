-- DESE wants to assess which schools achieved 
-- a 100% graduation rate. In 6.sql, write 
-- a SQL query to find the names of schools 
-- (public or charter!) that reported 
-- a 100% graduation rate.
SELECT schools.name
FROM schools
    INNER JOIN graduation_rates g ON g.school_id = schools.id
WHERE g.graduated = 100;
