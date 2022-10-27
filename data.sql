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

--Week1 Project 3

-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-4-23');
--Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
INSERT INTO vets (name, age, date_of_graduation)
VALUES('Maisy Smith', 26, '2019-2-17');
--Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
INSERT INTO vets (name, age, date_of_graduation)
VALUES('Stephanie Mendez', 64, '1981-5-4');
--Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO vets (name, age, date_of_graduation)
VALUES('Jack Harkness', 38, '2008-1-8');

--Insert the following data for specialties:
--Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (vet_id,specie_id) VALUES (1,1);
--Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (vet_id,specie_id) VALUES (3,1);
INSERT INTO specializations (vet_id,specie_id) VALUES (3,2);
--Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (vet_id,specie_id) VALUES (4,2);

--Insert the following data for visits
--Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(1, 1, '2020-5-24');
--Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(3, 1, '2020-7-22');
--Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(4, 2, '2021-2-2');
--Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 3, '2020-1-5');
--Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 3, '2020-3-8');
--Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 3, '2020-5-14');
--Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(3, 4, '2021-5-14');
--Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(4, 5, '2021-2-24');
--Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 6, '2019-12-21');
--Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(1, 6, '2020-8-10');
--Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 6, '2021-4-7');
--Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(3, 7, '2019-9-29');
--Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(4, 8, '2020-10-3');
--Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(4, 8, '2020-11-4');
--Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 9, '2019-2-24');
--Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 9, '2019-5-15');
--Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 9, '2020-2-27');
--Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(2, 9, '2020-8-3');
--Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(3, 10, '2020-5-24');
--Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(1, 10, '2021-1-11');

