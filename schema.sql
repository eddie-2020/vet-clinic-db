-- Create the table in the specified schema

CREATE TABLE dbo.animal
(
    id INT NOT NULL PRIMARY KEY, -- primary key column
    name [NVARCHAR](50) NOT NULL,
    date_of_birth [NVARCHAR](50) NOT NULL,
    escape_attempts [NVARCHAR](50) NOT NULL,
    neutered [NVARCHAR](50) NOT NULL,
    weight_kg [NVARCHAR](50) NOT NULL
    -- specify more columns here
);