/*Queries that provide answers to the questions from all projects.*/
--Week1 Project1
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth  BETWEEN '2016-1-1' AND '2019-1-1';
SELECT name FROM animals WHERE neutered =TRUE AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name ='Agumon' OR name='Pikachu';
SELECT name , escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;


--Week1 Project2
Begin;
UPDATE animals 
SET species='unspecified';
ROLLBACK;

Begin;
UPDATE animals 
SET species='digimon'
WHERE name LIKE '%mon';
UPDATE animals 
SET species='pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-1-1';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = -weight_kg;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = -weight_kg WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) FROM animals; 
SELECT COUNT(*) FROM animals WHERE escape_attempts>0; 
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) AS escapes_attempts FROM animals GROUP BY neutered ORDER BY MAX(escape_attempts) DESC ;
SELECT MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals; 
SELECT AVG(escape_attempts) AS avarage_escape_attempts 
FROM animals 
WHERE date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31';

--Week 1 Project 3

--What animals belong to Melody Pond?
SELECT animals.name as animals_owned_by_Melody_Pond
FROM owners
INNER JOIN animals ON animals.owner_id=owners.id
WHERE owners.full_name='Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name as animals_of_type_Pokemon
FROM animals
INNER JOIN species ON animals.species_id=species.id
WHERE species.name='Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON animals.owner_id=owners.id;

--How many animals are there per species?
SELECT species.name, COUNT(animals.species_id)
FROM animals 
JOIN species ON species.id = animals.species_id 
GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name as all_Digimon_owned_by_Jennifer
FROM owners
INNER JOIN animals ON animals.owner_id=owners.id
WHERE owners.full_name='Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name as all_animals_owned_Dean_Winchester_that_haven_not_tried_to_escape
FROM owners
INNER JOIN animals ON animals.owner_id=owners.id
WHERE owners.full_name='Dean Winchester'AND animals.escape_attempts=0;


--Who owns the most animals?
SELECT  MAX(owners.full_name) as the_person_who_owns_most_animals, COUNT(animals.owner_id) as number_of_animals
FROM     animals
INNER JOIN owners ON animals.owner_id=owners.id
GROUP BY animals.owner_id
ORDER BY COUNT(*) DESC 
LIMIT    1;
