-- from the terminal run:
-- psql < meds.pgsql

DROP DATABASE IF EXISTS meds_db;

CREATE DATABASE meds_db;

\c meds_db;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    speciality TEXT
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    insurence TEXT,
    birthday TEXT
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    arrival_date TEXT 
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases,
    notes TEXT
);

INSERT INTO doctors
(name, speciality)
VALUES
('DR MARSH','HEART AND LUNG');

INSERT INTO patients
(name, insurence, birthday)
VALUES('Gregory Marsh', 'GTM AUTO', '6/15/1986');

INSERT INTO visits
(arrival_date)
VALUES('6/15/86');

INSERT INTO diseases
(name, description)
VALUES
('broken heeart', 'Lookin for love in the wrong places');

INSERT INTO diagnoses
(notes)
VALUES ('This man appears to be heartbroken');