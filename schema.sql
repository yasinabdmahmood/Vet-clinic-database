/* Database schema to keep the structure of entire database. */
--Week 1 Project1
CREATE DATABASE vet_clinic;       

CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(250),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL (4, 2));

--Week 1 Project2
ALTER TABLE animals ADD species  varchar(100);

--Week 2 Project3

-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners (
id INT   GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name VARCHAR(100),
age INT
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species  (
id INT   GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name  VARCHAR(100)
);


-- Modify animals table:
--Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE animals
ADD PRIMARY KEY (id);
--Remove column species
ALTER TABLE animals
DROP COLUMN species;
--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT FK_species_id
FOREIGN KEY (species_id) REFERENCES species (id);

--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT FK_owner_id
FOREIGN KEY (owner_id) REFERENCES owners (id);


--Insert the following data into the owners table
--Sam Smith 34 years old.
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
--Jennifer Orwell 19 years old.
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
--Bob 45 years old.
INSERT INTO owners (full_name, age)
VALUES ('Bob ', 45);
--Melody Pond 77 years old.
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
--Dean Winchester 14 years old.
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
--Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

-- Insert the following data into the species table:
-- Pokemon
-- Digimon
INSERT INTO species  (name)
VALUES ('Pokemon');
INSERT INTO species  (name)
VALUES ('Digimon');


