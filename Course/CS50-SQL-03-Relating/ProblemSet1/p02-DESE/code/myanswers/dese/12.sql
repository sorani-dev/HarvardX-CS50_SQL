-- A parent asks you for advice on finding the best 
-- public school districts in Massachusetts. 
-- In 12.sql, write a SQL query to find public school districts 
-- with above-average per-pupil expenditures and 
-- an above-average percentage of teachers rated “exemplary”. 
-- Your query should return the districts’ names, 
-- along with their per-pupil expenditures and 
-- percentage of teachers rated exemplary. 
-- Sort the results first by the percentage of teachers rated exemplary 
-- (high to low), then by the per-pupil expenditure (high to low).
SELECT districts.name,
    e.per_pupil_expenditure,
    s.exemplary
FROM districts
    INNER JOIN expenditures e ON e.district_id = districts.id
    INNER JOIN staff_evaluations s ON s.district_id = districts.id
WHERE s.exemplary > (
        SELECT AVG(staff_evaluations.exemplary)
        from staff_evaluations
    )
    AND e.per_pupil_expenditure > (
        SELECT AVG(expenditures.per_pupil_expenditure)
        from expenditures
    )
    AND districts.type = "Public School District"
ORDER BY s.exemplary DESC,
    e.per_pupil_expenditure DESC;
