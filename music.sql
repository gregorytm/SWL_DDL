-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE boring_info
(
  id SERIAL PRIMARY KEY,
  duration_in_seconds INTEGER NOT NULL,
  releasae_date DATE NOT NULL,
  producers TEXT [] NOT NULL
);

CREATE TABLE album_artists
(
  id SERIAL PRIMARY KEY,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INT REFERENCES boring_info,
  release_date INT REFERENCES boring_info,
  artists INT REFERENCES album_artists,
  album INT REFERENCES album_artists,
  producers INT REFERENCES boring_info
);

INSERT INTO boring_info
( duration_in_seconds, releasae_date, producers)
VALUES
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}'),
(238,'04-15-1997','{"Dust Brothers", "Stephen Lironi"}');

INSERT INTO album_artists
(artists, album)
VALUES
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere'),
('{"Hanson"}', 'Middle of Nowhere');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1),
  ('MMMBop', 1, 1, 1, 1, 1);
