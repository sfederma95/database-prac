DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(10) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    region TEXT
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE,
    description TEXT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    title VARCHAR(15) NOT NULL,
    description TEXT
);

CREATE TABLE category_sort
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);