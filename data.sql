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