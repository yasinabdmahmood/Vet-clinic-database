/* Database schema to keep the structure of entire database. */
--Week 1 Project1
CREATE DATABASE vet_clinic;       

CREATE TABLE animal(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(250),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL (4, 2));

--Week 1 Project2
ALTER TABLE animals ADD species  varchar(100);




