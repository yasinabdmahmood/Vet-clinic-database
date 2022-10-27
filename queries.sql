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


--Week3 Project3

-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
SELECT vets.name,animals.name,visits.date_of_visit
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON animals.id = visits.animal_id
WHERE vets.name='William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1 ;


--How many different animals did Stephanie Mendez see?
SELECT  COUNT(distinct animals.name) as number_of_animals_seen_by_Stephanie_Mendez
FROM visits
INNER JOIN animals ON animals.id=visits.animal_id
INNER JOIN vets ON vets.id=visits.vet_id
WHERE vets.name='Stephanie Mendez';

--List all vets and their specialties, including vets with no specialties.
SELECT  vets.name ,species.name
FROM vets
LEFT JOIN specializations ON vets.id=specializations.vet_id
LEFT JOIN species ON species.id=specializations.specie_id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT  animals.name ,visits.date_of_visit
FROM visits
INNER JOIN animals ON animals.id=visits.animal_id
INNER JOIN vets ON vets.id=visits.vet_id
WHERE vets.name='Stephanie Mendez' AND visits.date_of_visit>'2020-4-1' AND visits.date_of_visit<'2020-8-30';

--What animal has the most visits to vets?
SELECT animals.name , COUNT(animals.name) 
FROM visits
LEFT JOIN animals ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC LIMIT 1;

--Who was Maisy Smith's first visit?
SELECT vets.name,animals.name,visits.date_of_visit
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON animals.id = visits.animal_id
WHERE vets.name='Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1 ;

--Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*,vets.*,visits.*
FROM visits 
LEFT JOIN animals ON animals.id = visits.animal_id
LEFT JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT  COUNT(DISTINCT date_of_visit) as num_of_visits 
FROM (SELECT a.name,a.species_id,ve.name,sp.specie_id,v.date_of_visit
FROM visits v
INNER  JOIN animals a ON a.id = v.animal_id
INNER  JOIN vets ve  ON ve.id = v.vet_id
INNER  JOIN species s ON s.id = a.species_id
INNER  JOIN specializations sp ON sp.specie_id = ve.id
ORDER BY v.date_of_visit DESC) AS x
WHERE x.species_id <> specie_id;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT x.specie_name,COUNT(*)
FROM (SELECT vets.name AS vet_name,animals.name AS animal_name,species.name AS specie_name 
FROM visits 
INNER JOIN animals ON animals.id=visits.animal_id
INNER JOIN vets ON vets.id=visits.vet_id
INNER JOIN species ON species.id = animals.species_id
WHERE vet_id=2) AS x
GROUP BY x.specie_name   
ORDER BY COUNT(*) DESC LIMIT 1;