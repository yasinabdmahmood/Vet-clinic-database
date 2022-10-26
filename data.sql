/* Populate database with sample data. */
--Week1 Project1
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered,weight_kg)
VALUES ('Agumon', '2020-3-2', 0, FALSE,10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered,weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE,8.00);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered,weight_kg)
VALUES ('Pikachu', '2021-1-7', 1, FALSE,15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered,weight_kg)
VALUES ('Devimon', '2017-5-12', 5, TRUE,11.00);


--Week1 Project2
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Charmander', '2020-2-8', 0, FALSE ,-11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Plantmon', '2020-11-15', 2, TRUE ,-5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Squirtle', '1993-4-2', 3, FALSE ,-12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Angemon', '2005-6-12', 1, TRUE ,-45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Boarmon', '2005-6-7', 7, TRUE ,20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Blossom', '1998-10-13', 3, TRUE ,17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered , weight_kg )
VALUES ('Ditto', '2022-5-14', 4, TRUE ,22);


Begin;
UPDATE animals 
SET species='unspecified';
ROLLBACK;

--Week 1 Project 3

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
--All other animals are Pokemon
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE name NOT  LIKE '%mon';

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


--Modify your inserted animals to include owner information (owner_id)
--Sam Smith owns Agumon.
UPDATE animals SET owner_id =1  WHERE name='Agumon';
--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id =2  WHERE name IN ('Gabumon', 'Pikachu');
--Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id =3   WHERE name IN ('Devimon', 'Plantmon');
--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id =4   WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
--Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id =5   WHERE name IN ('Angemon', 'Boarmon');

