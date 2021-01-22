DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    entry_date TIMESTAMP
);

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE,
    treatment TEXT
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    diagnosis_1 INTEGER REFERENCES diseases ON DELETE CASCADE,
    diagnosis_2 INTEGER REFERENCES diseases ON DELETE CASCADE,
    diagnosis_3 INTEGER REFERENCES diseases ON DELETE CASCADE
);

CREATE TABLE care_chart 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    primary_doc INTEGER REFERENCES doctors ON DELETE CASCADE,
    secondary_doc INTEGER REFERENCES doctors ON DELETE CASCADE,
    back_up_doc INTEGER REFERENCES doctors ON DELETE CASCADE
);