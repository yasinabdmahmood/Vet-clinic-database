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


--Week1 Project 4
-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date
CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation DATE
)

-- There is a many-to-many relationship between the tables species and vets: 
-- a vet can specialize in multiple species, and a species can have multiple vets 
-- specialized in it. Create a "join table" called specializations to handle this
--  relationship.
CREATE TABLE specializations(vet_id INT,specie_id INT);

-- There is a many-to-many relationship between the tables animals and vets: 
-- an animal can visit multiple vets and one vet can be visited by multiple animals. 
-- Create a "join table" called visits to handle this relationship, 
-- it should also keep track of the date of the visit.
CREATE TABLE visits (
	vet_id INT,
	animal_id INT,
	date_of_visit DATE
);

