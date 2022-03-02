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

-- What animals belong to Melody Pond?
SELECT animal.name FROM animal
JOIN owners ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animal.*, species.name AS species_name FROM animal
JOIN species ON animal.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animal.name AS animal_name, owners.fulL_name AS owner_name FROM owners 
LEFT JOIN animal ON owners.id = animal.owners_id;


-- How many animals are there per species?
SELECT species.name, COUNT(*) FROM animal 
JOIN species ON species.id = animal.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animal.name AS animal_name, owners.full_name AS owner_name, species.name AS species_name FROM animals
JOIN species ON species.id = animal.species_id JOIN owners ON owners.id = animal.owner_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animal
JOIN owners ON animal.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animal.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animal.name) AS num_animal FROM owners
LEFT JOIN animal ON owners.id = animal.owner_id GROUP BY owners.full_name ORDER BY num_animal DESC;

-- Who was the last animal seen by William Tatcher?
SELECT animal.name, vets.name, visits.date_of_visit FROM vets
JOIN visits ON vets_id = visits.vets_id
JOIN animal ON animal_id = visits.animal_id
WHERE vets.name = 'William Tatcher'
ORDER BY visit.date_of_visit DESC

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCTION) AS num_animal_visited FROM vets
JOIN visits ON vets_id = visits.vets_id
WHERE vets_id = 'Stephanie Mendez'

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialized_in
FROM vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animal.name AS animal_name, visits.data_of_visit FROM animal
JOIN visits ON visits.animal_id = animal.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT animal.name, COUNT(*) AS count FROM animal
JOIN visits ON visits.animal_id = animal.id
GROUP BY animal.name
ORDER BY count DESC

-- Who was Maisy Smith's first visit?
SELECT vets.name, visits.date_of_visit, animal.name FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animal ON animal.id = visits.animal_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT date_of_visit, animal.date_of_birth AS animal_dob, animal.escape_attempts, animal.neutered, animal.weight_kg AS animal_weight, vets.name AS vet_name, vets.age AS vet_age, vets.data_of_graduation from visits
JOIN animal ON animal.id = visits.animal_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits
JOIN animal ON animal.id = visits.animal_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animal.species_id != specializations.species_id

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS species, COUNT(*) FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animal ON animal.id = visits.animal_id
JOIN species ON species.id = animal.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name

-- Phase 5 database performance audit 

EXPLAIN ANALYSE SELECT COUNT(*) FROM visits WHERE animal_id = 4;
EXPLAIN ANALYSE SELECT * FROM visits WHERE vets_id = 2;
EXPLAIN ANALYSE SELECT visits_id, animal_id, vets_id, date_of_visit FROM visits WHERE vets_id = 2;
EXPLAIN ANALYSE SELECT * FROM owners WHERE email = 'owner_18327@mail.com'
