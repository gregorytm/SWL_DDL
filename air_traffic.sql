-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE departures_info
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

CREATE TABLE arrivals_info
(
  id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE flight_details
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  airline TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  departures INT REFERENCES departures_info,
  arrivals INT REFERENCES arrivals_info,
  flight_info INT REFERENCES flight_details
);

INSERT INTO departures_info 
  (departure, from_city, from_country)
VALUES
  ('2018-12-19 12:45:00','Washington DC', 'United States'),
  ('2018-12-19 12:45:00','Tokyo', 'Japan'),
  ('2018-12-19 12:45:00','Los Angeles', 'United States'),
  ('2018-12-19 12:45:00','Seattle','United States'),
  ('2018-12-19 12:45:00','Paris', 'France'),
  ('2018-12-19 12:45:00','Dubai','UAE'),
  ('2018-12-19 12:45:00','New York', 'United States'),
  ('2018-12-19 12:45:00','Cedar Rapids', 'United States'),
  ('2018-12-19 12:45:00','Charlotte', 'United States'),
  ('2018-12-19 12:45:00','ASao Paolo', 'Brazil');

INSERT INTO arrivals_info
    (arrival, to_city, to_country)
VALUES
  ('2018-04-08 12:00:00','Seattle', 'United States'),
  ('2018-04-08 12:00:00','London', 'United Kingdom'),
  ('2018-04-08 12:00:00','Las Vegas', 'United States'),
  ('2018-04-08 12:00:00','Mexico City', 'Mexico'),
  ('2018-04-08 12:00:00','Casablanca', 'Morocco'),
  ('2018-04-08 12:00:00','Beijing', 'China'),
  ('2018-04-08 12:00:00','Charlotte', 'United States'),
  ('2018-04-08 12:00:00','Chicago', 'United States'),
  ('2018-04-08 12:00:00','New Orleans', 'United States'),
  ('2018-04-08 12:00:00','Santiago', 'Chile');

INSERT INTO flight_details
 (seat, airline)
 VALUES
 ('33B','United'),
 ('8A', 'British Airways'),
 ('12F', 'Delta'),
 ('20A', 'Delta'),
 ('23D','TUT Fly Belgium'),
 ('18C','Air China'),
 ('9E','United'),
 ('la','american airlines'),
 ('32b', 'American Airlines'),
 ('10d', 'Avianca Brizil');
 
 INSERT INTO tickets
  (first_name, last_name, flight_info, departures, arrivals)
VALUES
  ('Jennifer', 'Finch', '1', '1', '1'),
  ('Thadeus', 'Gathercoal','2','2','2'),
  ('Sonja', 'Pauley','3','3','3'),
  ('Jennifer', 'Finch','4','4','4'),
  ('Waneta', 'Skeleton','5','5','5'),
  ('Thadeus', 'Gathercoal','6','6','6'),
  ('Berkie', 'Wycliff','7','7','7'),
  ('Alvin', 'Leathes','8','8','8'),
  ('Berkie', 'Wycliff','9','9','9'),
  ('Cory', 'Squibbes','10','10','10');