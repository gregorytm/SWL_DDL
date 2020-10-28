-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits,
  galaxy INTEGER REFERENCES galaxy,
  moons INTEGER REFERENCES moons
);

CREATE TABLE orbits (
  id SERIAL PRIMARY KEY,
  orbits_name TEXT NOT NULL
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT 
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moons_list TEXT[]
);

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
('Earth', 1.00, 1, 1, 1),
('Mars', 1.88, 1,1,2),
('Venus', 0.62, 1,1,3),
('Neptune', 164.8, 1,1,4),
('Proxima Centauri b', 11.0, 2, 1, 5),
('Gliese 876 b', 61.0, 3 ,1 ,6);

INSERT INTO orbits (orbits_name)
VALUES
('The sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxy (galaxy_name)
VALUES
('Milky Way');

INSERT INTO moons (moons_list)
VALUES
('{"The Moon"}'),
('{"Phobos", "Deimos"}'),
('{}'),
('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('{}'),
('{}');