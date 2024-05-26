-- Is there a relationship between school expenditures 
-- and graduation rates? 
-- In 11.sql, write a SQL query to display the names of schools,
--  their per-pupil expenditure, and their graduation rate. 
--  Sort the schools from greatest per-pupil expenditure to least. 
--  If two schools have the same per-pupil expenditure, sort by school name.
--     You should assume a school spends the same amount per-pupil 
--     their district as a whole spends.
SELECT schools.name,
    e.per_pupil_expenditure,
    g.graduated
FROM schools
    INNER JOIN districts d ON d.id = schools.district_id
    INNER JOIN expenditures e ON e.district_id = d.id
    INNER JOIN graduation_rates g ON g.school_id = schools.id
ORDER BY 2 DESC,
    1 ASC;
