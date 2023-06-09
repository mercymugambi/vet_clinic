/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11),
  ('Charmander', '2020-02-08', 0, false, -11, ''),
  ('Plantmon', '2021-11-15', 2, true, -5.7, ''),
  ('Squirtle', '1993-04-02', 3, false, -12.13, ''),
  ('Angemon', '2005-06-12', 1, true, -45, ''),
  ('Boarmon', '2005-06-07', 7, true, 20.4, ''),
  ('Blossom', '1998-10-13', 3, true, 17, ''),
  ('Ditto', '2022-05-14', 4, true, 22, ''),
  ('Sam Smith', 34);

  INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');


-- Modify your inserted animals so it includes the species_id value:
UPDATE animals
SET species_id = (
    CASE 
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END
);

update animals
set owners_id =(
 select id from owners where full_name = 'Sam Smith'
)
where name = 'Agumon'

update animals
set owners_id =(
 select id from owners where full_name = 'Jennifer Orwell'
)
where name IN ('Gabumon', 'Pikachu');

update animals
set owners_id =(
 select id from owners where full_name = 'Bob'
)
where name IN ('Devimon', 'Plantmon');

update animals
set owners_id =(
 select id from owners where full_name = 'Melody Pond'
)
where name IN ('Charmander', 'Squirtle', 'Blossom');

update animals
set owners_id =(
 select id from owners where full_name = 'Dean Winchester'
)
where name IN ('Angemon', 'Boarmon');


