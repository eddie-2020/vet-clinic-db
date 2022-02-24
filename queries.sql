-- Query the total count of animal

SELECT * from animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
SELECT name FROM animal WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animal WHERE weight_kg > '10.5kg';
SELECT * FROM animal WHERE neutered = 'true' OR neutered='false';
SELECT * FROM animal WHERE name!= 'Gabumon';
SELECT * FROM animal WHERE weight_kg>= '10.4kg' AND weight_kg<= '17.3kg' OR weight_kg = '10.23kg';