/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE NAME LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempt<3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempt FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name<>'Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

-- First transaction block of codes
BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT species from animals; 
ROLLBACK;
SELECT species from animals;


-- Second Transaction block of codes
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE species IS NULL;
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

-- Third Transaction block of codes
BEGIN;
DELETE FROM animals;
SELECT COUNT(*) FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM animals;
COMMIT;

-- Fourth Transaction block of codes
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=(weight_kg*-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=(weight_kg*-1) WHERE weight_kg<0;
COMMIT;

-- how many animals are there?
SELECT COUNT(*) AS total_animals FROM animals;

-- how many animals have never tried to escape
SELECT COUNT(*) AS no_escape FROM animals WHERE escape_attempt=0;

-- what is the average weight on animals
SELECT AVG(weight_kg) AS average_weight FROM animals;

-- who escape most neutered or not neutered
SELECT neutered, SUM(escape_attempt)
FROM animals
GROUP BY neutered
ORDER BY SUM(escape_attempt) DESC
LIMIT 1;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempt) AS average_escape_attempt FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- what animals belong to Melody Pond
SELECT name FROM animals JOIN owners ON animals.owner_id =owners.id WHERE owners.full_name='Melody Pond';

-- All animals that are Pokemon
SELECT animals.name FROM animals JOIN species ON animals.species_id =species.id WHERE species.name='Pokemon';

-- All owners and their animals
SELECT full_name, name FROM owners FULL JOIN animals ON owners.id = animals.owner_id;

-- how many animals are there per species
SELECT species.name,COUNT(*) 
FROM animals 
JOIN species ON animals.species_id=species.id 
GROUP BY species.name;

-- List of all Digimon owned by Jennifer Orwell
SELECT animals.name 
FROM animals JOIN owners ON animals.owner_id =owners.id 
JOIN species ON animals.species_id=species.id 
WHERE owners.full_name='Jennifer Orwell' 
AND species.name='Digimon';

-- List of all animals owned by Dean Wenchester that haven't tried to escape
SELECT name
FROM animals 
JOIN owners ON animals.owner_id=owners.id 
WHERE owners.full_name= 'Dean Winchester' 
AND escape_attempt=0;

-- Who owns the most animals
SELECT full_name, COUNT(animals.name)
FROM owners 
JOIN animals ON animals.owner_id=owners.id
GROUP BY owners.full_name
ORDER BY COUNT(animals.name) DESC
LIMIT 1;

-- Who was the last animal seen by William Tatcher
SELECT animals.name 
FROM animals 
JOIN visits ON animals.id=visits.animals_id 
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- how many different animals did Stephanie Mendez see
SELECT COUNT(animals.name)
FROM animals 
JOIN visits ON animals.id=visits.animals_id 
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name

-- List of all vets and their specialties
SELECT vets.name AS vet_name, species.name AS specialization
FROM vets 
LEFT JOIN specializations ON vets.id=specializations.vets_id 
LEFT JOIN species ON species.id = specializations.species_id

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name
FROM animals 
JOIN visits ON visits.animals_id=animals.id 
JOIN vets ON visits.vets_id = vets.id
WHERE visits.date_of_visit 
BETWEEN '2020-04-01' AND '2020-08-30' 
AND vets.name='Stephanie Mendez'

-- Animals with the most visit to vets
SELECT animals.name, COUNT(visits.animals_id) AS total_visits
FROM animals 
JOIN visits ON visits.animals_id=animals.id 
JOIN vets ON visits.vets_id = vets.id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;

-- Who was Maisy Smith first visit
SELECT animals.name, visits.date_of_visit
FROM animals 
JOIN visits ON visits.animals_id=animals.id 
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name='Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit
SELECT animals.name,  
    animals.escape_attempt,
    animals.weight_kg,
    species.name,
    vets.name AS vet_name,
    visits.date_of_visit 
FROM animals 
JOIN visits ON visits.animals_id=animals.id 
JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id
ORDER BY visits.date_of_visit DESC
LIMIT 1

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT SUM(count) AS all_visits 
FROM (
SELECT COUNT(distinct visits.date_of_visit)
FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE animals.species_id <> specializations.species_id
UNION ALL
SELECT COUNT(visits.date_of_visit) FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id ISNULL
) AS totalVisits;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(visits.date_of_visit)AS number_of_visit  
FROM visits
JOIN animals ON animals.id=visits.animals_id
JOIN species ON animals.species_id=species.id
JOIN vets ON visits.vets_id=vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(visits.date_of_visit) DESC
LIMIT 1;