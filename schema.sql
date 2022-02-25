-- Create the table in the specified schema

CREATE TABLE dbo.animal
(
    id INT NOT NULL PRIMARY KEY, -- primary key column
    name string NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg DECIMAL
    -- specify more columns here
);

ALTER TABLE dbo.animal
    ADD species VARCHAR(60);
    