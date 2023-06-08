-- display animals whose name ends in "mon"
SELECT * FROM animals
WHERE name LIKE '%mon';


-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';





