-- In 3.sql, choose a location of your own 
-- and write a SQL query to find the normal temperature 
-- at 0 meters, 100 meters, and 200 meters. 
-- You might find Google Earth helpful 
-- if you’d like to find some coordinates to use!
SELECT "0m",
    "100m",
    "200m"
FROM normals
WHERE latitude = "-39.5"
    AND longitude = "-105.5";
-- Denver
-- WHERE latitude = "-67.5"
--     AND longitude = "-133.5";
-- 37.3785, -122.1375
