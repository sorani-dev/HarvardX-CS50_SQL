-- In Massachusetts, school district expenditures a
-- re in part determined by local taxes on property 
-- (e.g., home) values. 
-- In 10.sql, write a SQL query to find the 10 public school 
-- districts with the highest per-pupil expenditures. 
-- Your query should return the names of the districts 
-- and the per-pupil expenditure for each.
SELECT districts.name, e.per_pupil_expenditure
FROM districts
    INNER JOIN expenditures e ON e.district_id = districts.id
WHERE districts.type = "Public School District"
ORDER BY e.per_pupil_expenditure DESC
LIMIT 10;
