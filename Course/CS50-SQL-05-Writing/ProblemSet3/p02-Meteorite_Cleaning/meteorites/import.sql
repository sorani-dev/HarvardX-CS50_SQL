CREATE TABLE IF NOT EXISTS  meteorites_temp (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT,
    "year" NUMERIC  DEFAULT NULL,
    "lat" NUMERIC  DEFAULT NULL,
    "long" NUMERIC  DEFAULT NULL,
    PRIMARY KEY("id")
);



UPDATE meteorites_temp
SET "mass" = NULL
WHERE "mass" == '';


UPDATE meteorites_temp
SET "year" = NULL
WHERE "year" == '';

UPDATE meteorites_temp
SET "lat" = NULL
WHERE "lat" == '';

UPDATE meteorites_temp
SET "long" = NULL
WHERE "long" == '';


UPDATE meteorites_temp
SET "mass" = ROUND("mass", 2)
WHERE "mass" IS NOT NULL;

UPDATE meteorites_temp
SET "lat" = ROUND("lat", 2)
WHERE "lat" IS NOT NULL;


UPDATE meteorites_temp
SET "long" = ROUND("long", 2)
WHERE "log" IS NOT NULL;

CREATE TABLE IF NOT EXISTS meteorites(
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT,
    "year" NUMERIC DEFAULT NULL,
    "lat" NUMERIC DEFAULT NULL,
    "long" NUMERIC DEFAULT NULL,
    PRIMARY KEY("id")
);

INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")

SELECT meteorites_temp."name", meteorites_temp."class", meteorites_temp."mass", meteorites_temp."discovery", meteorites_temp."year", meteorites_temp."lat", meteorites_temp."long"
FROM meteorites_temp
WHERE meteorites_temp.nametype != 'Relict'
ORDER BY meteorites_temp.year, meteorites_temp.name
; 
