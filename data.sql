-- Insert rows into table 'animal'
INSERT INTO animal
   ([id],[name],[date_of_birth],[escape_attempts],[neutered],[weight_kg])
VALUES
   ( 1, N'Agumon', '03/02/2020', 0, 'true', N'10.23kg'),
   ( 2, N'Gabumon', '15/11/2018', 2, 'true', N'8kg'),
   ( 3, N'Pikachu', '07/01/2021', 1, 'false', N'15.04kg'),
   ( 4, N'Devimon', '12/04/2017', 5, 'true', N'11kg'),

   -- Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.

   ( 5, N'Charmander', '08/02/2020', 0, 'false', N'-11kg'),

   -- Animal: Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.

   ( 6, N'Plantmon', '15/11/2022', 2, 'true', N'-5.7kg'),

   -- Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.

   ( 7, N'Squirtle', '02/04/1993', 3, 'false', N'-12.13kg'),

   -- Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.

   ( 8, N'Angemon', '12/06/2005', 1, 'true', N'-45kg'),

   -- Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.

   ( 9, N'Boarmon', '07/06/2005', 7, 'true', N'20.4kg'),

   -- Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.

   ( 10, N'Blossom', '10/13/1998', 3, 'true', N'17kg')
GO