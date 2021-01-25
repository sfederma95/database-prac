DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

INSERT INTO moons
  (name, orbits_around)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos',2),
  ('Naiad',3),
  ('Thalassa',3),
  ('Despina',3), 
  ('Galatea',3), 
  ('Larissa',3), 
  ('S/2004 N 1',3), 
  ('Proteus',3), 
  ('Triton',3), 
  ('Nereid',3), 
  ('Halimede',3), 
  ('Sao',3), 
  ('Laomedeia',3), 
  ('Psamathe',3), 
  ('Neso',3);