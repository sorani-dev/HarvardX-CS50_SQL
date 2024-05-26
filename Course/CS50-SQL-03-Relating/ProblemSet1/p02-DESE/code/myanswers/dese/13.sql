-- In 13.sql, write a SQL query to answer a question you have about the data! 
-- The query should:
--     Involve at least one JOIN or subquery
-- What is the expenditure for the highest graduation rates
SELECT expenditures.per_pupil_expenditure,
    g.graduated,
    schools.name
FROM expenditures
    INNER JOIN schools ON schools.district_id = expenditures.district_id
    INNER JOIN graduation_rates g ON g.school_id = schools.id
WHERE g.graduated = 100
ORDER BY g.graduated DESC,
    expenditures.per_pupil_expenditure DESC;
