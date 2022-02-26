-- Insert rows into table 'animal'
INSERT INTO animal
   ([id],[name],[date_of_birth],[escape_attempts],[neutered],[weight_kg])
VALUES
   ( 1, N'Agumon', '03/02/2020', 0, 'true', N'10.23kg'),
   ( 2, N'Gabumon', '15/11/2018', 2, 'true', N'8kg'),
   ( 3, N'Pikachu', '07/01/2021', 1, 'false', N'15.04kg'),
   ( 4, N'Devimon', '12/04/2017', 5, 'true', N'11kg'),
   ( 5, N'Charmander', '08/02/2020', 0, 'false', N'-11kg'),
   ( 6, N'Plantmon', '15/11/2022', 2, 'true', N'-5.7kg'),
   ( 7, N'Squirtle', '02/04/1993', 3, 'false', N'-12.13kg'),
   ( 8, N'Angemon', '12/06/2005', 1, 'true', N'-45kg'),
   ( 9, N'Boarmon', '07/06/2005', 7, 'true', N'20.4kg'),
   ( 10, N'Blossom', '10/13/1998', 3, 'true', N'17kg')
GO

-- Owners table data
INSERT INTO owners
   ([id],[first_name],[age])
VALUES
   (1, N'Sam Smith', 34),
   (2, N'Jennifer Orwell', 19),
   (3, N'Melody Pond', 77),
   (4, N'Dean Winchester', 14),
   (5, N'Jodie Whittaker', 38)
GO

-- Species table data
INSERT INTO species
 ([id],[name])
VALUES
 (1, N'Pokemon'),
 (2, N'Digimon')
GO

BEGIN TRAN
UPDATE animal
SET species_id = 'Digimon' WHERE name LIKE '%mon';
UPDATE animal
SET species_id = 'Pokemon' WHERE species_id IS NULL;
COMMIT;

-- Modify your inserted animals to include owner information (owner_id)
UPDATE animal 
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') 
WHERE name = 'Agumon';

UPDATE animal
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') 
WHERE name = 'Pikachu' OR name = 'Gabumon';

-- Bob owns Devimon and Plantmon.
UPDATE animal
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animal
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') 
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animal 
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') 
WHERE name = 'Angemon' OR name = 'Boarmon';

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
BEGIN TRAN;
UPDATE animal
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animal
SET species_id = 1
WHERE species_id IS NULL;
COMMIT;

-- Insert vets query data
INSERT INTO vets
 ([id],[name],[age],[date_of_graduation])
VALUES
 (1, N'William Tatcher', 45, N'2000-04-23'),
 (2, N'Maisy Smith', 26, N'2019-01-17'),
 (3, N'Stephanie Mendez', 64, N'1981-04-05'),
 (4, N'Jack Harkness', 38, N'2008-08-06')
GO

-- Insert specializations query data
INSERT INTO specializations
 ([species_id],[vets_id])
VALUES
 (1, 1),
 (1, 3),
 (2, 3),
 (2, 4)
GO

-- animal visits
INSERT INTO visits
 ([animal_id],[vets_id],[data_of_visit])
VALUES
 ((SELECT id FROM animal WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-5-24'),
 ((SELECT id FROM animal WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-7-22'),
 ((SELECT id FROM animal WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-2-2'),
 ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-1-5'),
 ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-3-8'),
 ((SELECT id FROM animal WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-5-14'),
 ((SELECT id FROM animal WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-5-4'),
 ((SELECT id FROM animal WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-2-24'),
 ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
 ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-8-10'),
 ((SELECT id FROM animal WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-4-7'),
 ((SELECT id FROM animal WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-9-29'),
 ((SELECT id FROM animal WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-3'),
 ((SELECT id FROM animal WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-4'),
 ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-1-24'),
 ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-5-15'),
 ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-2-27'),
 ((SELECT id FROM animal WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-8-3'),
 ((SELECT id FROM animal WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-5-24'),
 ((SELECT id FROM animal WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-1-11')
GO

INSERT INTO visits
 ([animal_id],[vets_id],[date_of_visit])
SELECT * FROM (SELECT id FROM animal) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01', timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners
 ([full_name],[email])
SELECT 'Owner' , generate_series(1,2500000), 'owner_' , generate_series(1,2500000) , '@mail.com';
