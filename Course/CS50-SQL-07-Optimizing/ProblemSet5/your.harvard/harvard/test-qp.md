QUERY PLAN
|--SEARCH students USING INTEGER PRIMARY KEY (rowid=?)
|--SCAN enrollments
`--SEARCH courses USING INTEGER PRIMARY KEY (rowid=?)
QUERY PLAN
|--SEARCH students USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SCAN enrollments
   `--SCALAR SUBQUERY 1
      `--SCAN courses
QUERY PLAN
|--SCAN enrollments
|--SEARCH courses USING INTEGER PRIMARY KEY (rowid=?)
|--USE TEMP B-TREE FOR GROUP BY
`--USE TEMP B-TREE FOR ORDER BY
QUERY PLAN
`--SCAN courses
QUERY PLAN
|--SEARCH requirements USING INTEGER PRIMARY KEY (rowid=?)
`--SCALAR SUBQUERY 2
   |--SCAN satisfies
   `--SCALAR SUBQUERY 1
      `--SCAN courses
QUERY PLAN
|--SCAN satisfies
|--LIST SUBQUERY 1
|  `--SCAN enrollments
|--SEARCH requirements USING INTEGER PRIMARY KEY (rowid=?)
`--USE TEMP B-TREE FOR GROUP BY
QUERY PLAN
`--SCAN courses
