/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id int PRIMARY KEY, 
    name varchar (100) NOT NULL,  
    date_of_birth date, 
    escape_attempts int, 
    neutered boolean, 
    weight_kg decimal 
);

-- Add a column species of type string to your animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- drop column species
ALTER TABLE animals
DROP column species

-- Add foreign KEY and create species_id column 
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id); 

-- Add foreign KEY and create owners_id column
ALTER TABLE animals
ADD COLUMN owners_id INT,
ADD CONSTRAINT fk_owners_id FOREIGN KEY (owners_id) REFERENCES owners (id);

CREATE TABLE vets (
  id SERIAL,
  name VARCHAR (255),
  age INT,
  date_of_graduation DATE,
	PRIMARY KEY (id)
);

CREATE TABLE specializations (
  vet_id INT,
  species_id INT,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  animal_id INT,
  vet_id INT,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);
