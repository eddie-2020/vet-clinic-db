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
   first_name string NOT NULL,
   age INT
);
GO

-- Species table

CREATE TABLE dbo.species
(
   id INT NOT NULL PRIMARY KEY, -- primary key column
   name string NOT NULL
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
ADD owners_id INT,
CONSTRAINT owners_id
FOREIGN KEY(owners_id)
REFERENCES species(id);


CREATE TABLE dbo.vets
(
   id INT NOT NULL PRIMARY KEY, -- primary key column
   name string NOT NULL,
   age INT,
   date_of_graduation DATE,
   PRIMARY KEY(id)
);
GO

CREATE TABLE dbo.specializations
(
   species_id INT,
   vets_id INT,
   CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
GO

CREATE TABLE dbo.visits
(
   animal_id INT,
   vets_id INT,
   date_of_visits DATE,
   CONSTRAINT fk_animal FOREIGN KEY(animal_id) REFERENCES animal(id),
   CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
GO

CREATE INDEX animal_id_visits_index ON visits(animal_id ASC)
CREATE INDEX vets_id_visits_index ON visits(vets_id ASC)
CREATE INDEX owners_id_visits_index ON visits(owners_id ASC) 
