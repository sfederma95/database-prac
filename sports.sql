DROP DATABASE IF EXISTS sports_league;

CREATE DATABASE sports_league;

\c sports_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    coach_name TEXT
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams ON DELETE SET NULL,
    team2 INTEGER REFERENCES teams ON DELETE SET NULL,
    referee INTEGER REFERENCES referees ON DELETE SET NULL,
    season INTEGER REFERENCES seasons ON DELETE SET NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    team INTEGER REFERENCES teams ON DELETE SET NULL,
    first_name TEXT NOT NULL,
    last_name TEXT
);

CREATE TABLE goals_scored
(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE CASCADE,
    game INTEGER REFERENCES matches ON DELETE CASCADE,
    goals_scored INTEGER NOT NULL
);

CREATE TABLE rankings
(
    id SERIAL PRIMARY KEY,
    team INTEGER REFERENCES teams ON DELETE CASCADE,
    season INTEGER REFERENCES seasons ON DELETE CASCADE,
    ranking INTEGER NOT NULL,
    UNIQUE (season,ranking)
)
