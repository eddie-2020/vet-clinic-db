-- Create the table in the specified schema

CREATE TABLE dbo.animal
(
    id INT NOT NULL PRIMARY KEY, -- primary key column
    name string NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg DECIMAL
);

ALTER TABLE dbo.animal
    ADD species VARCHAR(60);

-- Owners table

CREATE TABLE dbo.owners
(
   id INT NOT NULL PRIMARY KEY, -- primary key column
   first_name [NVARCHAR](50) NOT NULL,
   age INT
);
GO

-- Species table

CREATE TABLE dbo.species
(
   id INT NOT NULL PRIMARY KEY, -- primary key column
   name [NVARCHAR](50) NOT NULL
);
GO

-- Delete species column in animal table
ALTER TABLE animal
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animal
ADD species_id INT,
CONSTRAINT species_id
FOREIGN KEY(species_id)
REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animal
ADD owner_id INT,
CONSTRAINT owner_id
FOREIGN KEY(owner_id)
REFERENCES species(id);

