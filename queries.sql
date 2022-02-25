-- Query the total count of animal

SELECT * from animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
SELECT name FROM animal WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animal WHERE weight_kg > '10.5kg';
SELECT * FROM animal WHERE neutered = 'true' OR neutered='false';
SELECT * FROM animal WHERE name!= 'Gabumon';
SELECT * FROM animal WHERE weight_kg>= '10.4kg' AND weight_kg<= '17.3kg' OR weight_kg = '10.23kg';
-- ROLLBACK "unspecified"
BEGIN TRAN
UPDATE animal
SET species = 'unspecified'
WHERE species = 'NULL';
ROLLBACK;

BEGIN TRAN
UPDATE animal
SET species = 'Digimon' WHERE name Like '%mon'
UPDATE animal
SET species = 'Pokemon' WHERE species = 'NULL'
COMMIT;

BEGIN TRAN
DELETE animal
ROLLBACK;


BEGIN TRAN
DELETE FROM animal WHERE date_of_birth > '01-01-2022'
SAVE TRAN delete_some_data;
UPDATE animal SET weight_kg = -1 * weight_kg;
ROLLBACK TRAN delete_some_data;
UPDATE animal SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
ROLLBACK;


SELECT COUNT(*) FROM animal;

SELECT AVG(weight_kg) FROM animal;

SELECT COUNT(*) FROM animal WHERE neutered = 'false';
-- neutered WHERE false => 3

SELECT COUNT(*) FROM animal WHERE escape_attempts = '0';
-- escape_attempts => 2

SELECT MAX(escape_attempts) FROM animal;
-- maximum escape_attempt => 7

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animal GROUP BY species;

SELECT AVG(escape_attempt) FROM animal WHERE date_of_birth >= '1-1-1990' AND date_of_birth <= '12-31-2000' GROUP BY species;
