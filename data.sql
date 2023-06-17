/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Agumon', '2020-02-03',0, true,10.23) 
INSERT INTO animals(name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Gabumon', '2018-11-15',2, true,8) 
INSERT INTO animals(name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Pikachu', '2021-01-07',1, false, 15.04)
INSERT INTO animals(name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Devimon', '2017-05-12',5, true, 11)
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Charmander', '2020-02-08',0, false,-11)
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Plantmon', '2021-11-15',2, true,-5.7) 
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Squirtle', '1993-04-02',3, false,-12.13) 
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Angemon', '2005-06-12',1, true,-45) 
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Boarmon', '2005-06-07',7, true,20.4)
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Blossom', '1998-10-13',3, true, 17)
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Ditto', '2022-05-14',4, true, 22)  

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

UPDATE animals SET species_id = 2 WHERE NAME LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals 
SET owner_id = 1 
WHERE name ='Agumon';

UPDATE animals 
SET owner_id = 2 
WHERE name ='Gabumon' OR name='Pikachu';

UPDATE animals 
SET owner_id = 3 
WHERE name ='Devimon' OR name='Plantmon';

UPDATE animals 
SET owner_id = 4 
WHERE name ='Charmander' 
OR name='Squirtle' 
OR name='Blossom';

UPDATE animals 
SET owner_id = 4 
WHERE name ='Charmander' 
OR name='Squirtle' 
OR name='Blossom';


INSERT INTO vets(name,age,date_of_graduation)
VALUES('William Tatcher', 45,'2000-04-23');

INSERT INTO vets(name,age,date_of_graduation)
VALUES('Maisy Smith', 26,'2019-01-17');

INSERT INTO vets(name,age,date_of_graduation)
VALUES('Stephanie Mendez', 64,'1981-05-04');

INSERT INTO vets(name,age,date_of_graduation)
VALUES('Jack Harkness', 38,'2008-06-08');

-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (species_id, vets_id)
VALUES (1,1);

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (species_id, vets_id)
VALUES (2,3);
INSERT INTO specializations (species_id, vets_id)
VALUES (1,3);

-- Vet Jack Harkness is specialized in Digimon
INSERT INTO specializations (species_id, vets_id)
VALUES (2,4);

-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES (
    (SELECT animals.id FROM animals WHERE name='Agumon'),
    (SELECT vets.id FROM vets WHERE name='William Tatcher'),
    '2020-05-24' 
    );

-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES (
    (SELECT animals.id FROM animals WHERE name='Agumon'),
    (SELECT vets.id FROM vets WHERE name='Stephanie Mendez'),
    '2020-07-22' 
    );

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Gabumon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Jack Harkness'),
  '2021-02-02'
);

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2020-01-05'
);

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2020-03-08'
);

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2020-05-14'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Devimon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Stephanie Mendez'),
  '2021-05-04'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Charmander'),
  (SELECT vets.id FROM vets WHERE vets.name ='Jack Harkness'),
  '2021-02-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2019-12-21'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='William Tatcher'),
  '2020-08-10'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2021-04-07'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Squirtle'),
  (SELECT vets.id FROM vets WHERE vets.name ='Stephanie Mendez'),
  '2019-09-29'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Jack Harkness'),
  '2020-10-03'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Jack Harkness'),
  '2020-11-04'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2019-01-04'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2019-05-15'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2020-02-27'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name ='Maisy Smith'),
  '2020-08-03'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name ='Stephanie Mendez'),
  '2020-05-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name='Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name ='William Tatcher'),
  '2021-01-11'
);