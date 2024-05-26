CREATE VIEW by_district AS
SELECT district, families, households, population, male, female
FROM census
GROUP BY district;
