-- display animals whose name ends in "mon"
SELECT * FROM animals
WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals
WHERE neutered = true;

-- Find all animals not named Gabumon.
SELECT * FROM animals
WHERE name <> 'Gabumon';

-- Animals kg between 10.4 and 17.3
SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Start of new transaction with rollback
BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

-- Start of new transaction with pokeman and digimon commita
BEGIN;

UPDATE animals
SET species = 'pokemon'
WHERE species = '';

SELECT * FROM animals;

COMMIT;

-- delete animals table and rollback
BEGIN;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

-- Delete animals born after Jan 1st, 2022
BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SELECT * FROM animals;

ROLLBACK;

-- CREATE savepoint name dob_delete
BEGIN;

SAVEPOINT dob_delete;

-- multiply weight by -1
BEGIN;

UPDATE animals
SET weight_kg = weight_kg * -1;

SELECT * FROM animals;

-- weight UPDATE for all with -1
BEGIN;
SAVEPOINT weights;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

select * from animals

COMMIT;

-- total count for animals in vet clinic
SELECT count(*) as total_animals
from animals;

-- animals never escaped
SELECT count(*) as neverEscaped
from animals WHERE escape_attempts = 0;

-- average weight 
SELECT AVG(weight_kg) as average_weight
FROM animals.

-- Query for maxEscapes
SELECT MAX(escape_attempts) AS maxEscapes
FROM animals

GROUP BY neutered;

-- minmum and maximum weight of animals
SELECT species,  MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals

GROUP BY species;

-- average escape attempts
SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- create table owners
CREATE TABLE owners (
	id SERIAL,
	full_name varchar(255),
	age int,
	PRIMARY KEY (id)
);

-- create table species
CREATE TABLE species (
id SERIAL,
	name varchar (255),
	PRIMARY KEY (id)
);

--  animals belong to melody 
SELECT animals.name
FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owners_id

SELECT species_id, count(*) AS animals_per_species
FROM ANIMALS

GROUP BY species_id

select animals.name
from animals
join owners on animals.owners_id = owners.id
join species on animals.species_id = species.id
where species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell'

Select animals.name, animals.escape_attempts, animals.owners_id
From animals
join owners on animals.owners_id = owners.id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts = '0';

SELECT owners.full_name, COUNT(animals.id) AS animal_count
FROM owners
JOIN animals ON owners.id = animals.owners_id
GROUP BY owners.id, owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

-- Who was the last animal seen by William Tatcher?
select animals.name, visits.visit_date
from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
  AND visits.visit_date = (
    SELECT MAX(visit_date)
    FROM visits
    WHERE vet_id = vets.id
  );

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.id) AS Mendez_totals_seen
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'

SELECT vets.name, species_id
FROM vets
JOIN specializations ON vets.id = specializations.vet_id
ORDER BY vets.name;


SELECT animals.name, vets.name, visits.visit_date
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.animal_id) AS visit_count
FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT animals.name AS animal_name, visits.visit_date
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date ASC
LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id
WHERE specializations.vet_id IS NULL;

SELECT species.name, COUNT(*) AS num_visits
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY num_visits DESC

-- WEEK 2


