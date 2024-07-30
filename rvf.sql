-- Data Cleaning

SELECT *
FROM rvf;

-- 1. create a staging table for using

CREATE TABLE rvf_staging
LIKE rvf;

-- 2. populate the staging table

INSERT rvf_staging
SELECT *
FROM rvf;

SELECT *
FROM rvf_staging;

-- 3. drop the "divid" column for we won't need it

ALTER TABLE rvf_staging
DROP COLUMN divid;

SELECT *
FROM rvf_staging;

-- 4. change the names of places to the current terms as per the 2010 constitution

ALTER TABLE rvf_staging
RENAME COLUMN province to region;

ALTER TABLE rvf_staging
RENAME COLUMN district to county;

ALTER TABLE rvf_staging
RENAME COLUMN division to sub_county;

-- 5. rounding off the values

UPDATE rvf_staging 
SET rainfall = ROUND(rainfall, 1);

UPDATE rvf_staging 
SET elevation = ROUND(elevation, 0);

UPDATE rvf_staging 
SET slope = ROUND(slope, 0);

UPDATE rvf_staging 
SET clay = ROUND(clay, 0);

UPDATE rvf_staging 
SET humidity = ROUND(humidity, 0);

SELECT *
FROM rvf_staging;


