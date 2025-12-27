
DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";

-
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);


.import --csv --skip 1 meteorites.csv meteorites_temp


UPDATE "meteorites_temp"
SET "mass" = NULLIF("mass", ''),
    "year" = NULLIF("year", ''),
    "lat" = NULLIF("lat", ''),
    "long" = NULLIF("long", '');


UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);


CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);


INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "meteorites_temp";
