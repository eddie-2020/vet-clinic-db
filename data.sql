-- Insert rows into table 'animal'
INSERT INTO animal
   ([id],[name],[date_of_birth],[escape_attempts],[neutered],[weight_kg])
VALUES
   ( 1, N'Agumon', '3-2-2020', 0, 'true', N'10.23kg'),
   ( 2, N'Gabumon', '15-11-2018', 2, 'true', N'8kg'),
   ( 3, N'Pikachu', '7-1-2021', 1, 'false', N'15.04kg'),
   ( 4, N'Devimon', '12-04-2017', 5, 'true', N'11kg')
GO