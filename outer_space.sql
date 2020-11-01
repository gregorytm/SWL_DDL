-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE orbits (
  id SERIAL PRIMARY KEY,
  orbits_name TEXT NOT NULL
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT 
);

CREATE TABLE moons_index (
  id SERIAL PRIMARY KEY,
  moon_name TEXT,
  system_ID INTEGER
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits,
  galaxy INTEGER REFERENCES galaxy,
  moons INTEGER REFERENCES moons_index
);

INSERT INTO orbits (orbits_name)
VALUES
('The sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxy (galaxy_name)
VALUES
('Milky Way');

INSERT INTO moons_index (moon_name, system_ID)
VALUES
('The Moon',1),
('Phobos',2),
('Deimos',2),
(NULL, 3),
('Naiad',4),
('Thalassa',4),
('Despina',4),
('Galatea',4),
('Larissa',4),
('s/2004 n 1',4),
('Proteus',4),
('Triton',4),
('Nereid',4),
('Halimede',4),
('Sao',4),
('Laomedeia',4),
('Psamathe',4),
('Neso',4),
(NULL,5 ),
(NULL,6);


INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
('Earth', 1.00, 1, 1, 1),
('Mars', 1.88, 1,1,2),
('Venus', 0.62, 1,1,3),
('Neptune', 164.8, 1,1,4),
('Proxima Centauri b', 11.0, 2, 1, 5),
('Gliese 876 b', 61.0, 3 ,1 ,6);