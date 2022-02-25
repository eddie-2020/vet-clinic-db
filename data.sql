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