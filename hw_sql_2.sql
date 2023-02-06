CREATE TABLE musical_genre
(
	id SERIAL PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE musician
(
	id SERIAL PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE MusicainGenre
(
	id SERIAL PRIMARY KEY,
	musician INTEGER REFERENCES musician(id),
	genre INTEGER REFERENCES musical_genre(id)
);

CREATE TABLE album
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(128) NOT NULL,
	release DATE
);

CREATE TABLE MusicianAlbum
(
	id SERIAL PRIMARY KEY,
	musician INTEGER REFERENCES musician(id),
	album INTEGER REFERENCES album(id)
);

CREATE TABLE track
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	diraction TIME,
	album INTEGER REFERENCES album(id)
);

CREATE TABLE treasure
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	release	DATE,
	track INTEGER REFERENCES track(id)
);