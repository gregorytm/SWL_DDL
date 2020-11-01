-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers_index
(
  id SERIAL PRIMARY KEY,
  name_credit TEXT NOT NULL,
  album_credit INTEGER NOT NULL
);

CREATE TABLE artists_index
(
  id SERIAL PRIMARY KEY,
  artists_name TEXT NOT NULL,
  song_credit INTEGER NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INT REFERENCES artists_index,
  album TEXT NOT NULL,
  producers INT REFERENCES producers_index
);

INSERT INTO producers_index
(name_credit, album_credit)
VALUES
('Dust Brothers', 1),
('Stephen Lironi', 1),
('Roy Thomas Baker',2),
('Walter Afansieff',3),
('Benjamin Rice',4),
('Rick Parashar',5),
('Al Shux',6),
('Max Martin',7),
('Cirkut',7),
('Shellback',8),
('Benny Blanco',8),
('The Matrix',9),
('Darkchild',10);

INSERT INTO artists_index
(artists_name, song_credit)
VALUES
('Handson', 1),
('Queen',2),
('Mariah Cary',3),
('Bradley Cooper',4),
('Lady Gaga',4),
('Nickleback',5),
('Jay-Z',6),
('Alicia Keys',6),
('Katie Perry',7),
('Juciy J',7),
('Maroon 5', 8),
('Christina Aguilera',8),
('Avril Lavigne',9),
('Destinys Child',10);


INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 'A Night at the Opera', 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 'Daydream', 3),
  ('Shallow', 216, '09-27-2018', 4, 'A Star Is Born', 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 'Silver Side Up', 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 'The Blueprint 3', 6),
  ('Dark Horse', 215, '12-17-2013', 7, 'Prism', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 'Hands All Over', 8),
  ('Complicated', 244, '05-14-2002', 9, 'Let Go', 9),
  ('Say My Name', 240, '11-07-1999', 10, 'The Writing''s on the Wall', 10);
