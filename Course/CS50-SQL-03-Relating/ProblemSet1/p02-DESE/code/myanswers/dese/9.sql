-- Another parent wants to send their child to a district 
-- with few other students. In 9.sql, write a SQL query 
-- to find the name (or names) of the school district(s) 
-- with the single least number of pupils. Report only the name(s).
SELECT districts.name
FROM districts
    INNER JOIN expenditures e ON e.district_id = districts.id
ORDER BY e.pupils ASC
LIMIT 1;
