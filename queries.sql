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

-- drop column species
ALTER TABLE animals
DROP column species

-- Add foreign KEY and create species_id column 
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id); 