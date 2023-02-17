DROP TABLE IF EXISTS musician_genre;
DROP TABLE IF EXISTS musical_genre;
DROP TABLE IF EXISTS musician_album;
DROP TABLE IF EXISTS musician;
DROP TABLE IF EXISTS treasure_track;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS treasure;

CREATE TABLE musical_genre
(
	id SERIAL PRIMARY KEY,
	name varchar(30) UNIQUE NOT NULL
);

CREATE TABLE musician
(
	id SERIAL PRIMARY KEY,
	name varchar(30) NOT NULL
);

CREATE TABLE musician_genre
(
	musician_id INTEGER REFERENCES musician(id),
	genre_id INTEGER REFERENCES musical_genre(id),
	CONSTRAINT musician_genre_pk PRIMARY KEY (musician_id, genre_id)
);

CREATE TABLE album
(
	id SERIAL PRIMARY KEY,
	title VARCHAR(64) NOT NULL,
	release DATE
);

CREATE TABLE musician_album
(
	musician_id INTEGER REFERENCES musician(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT musician_album_pk PRIMARY KEY (musician_id, album_id)
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
	name VARCHAR(64) UNIQUE NOT NULL,
	release	DATE
);

CREATE TABLE treasure_track
(
	track_id INTEGER REFERENCES track(id),
	treasure_id INTEGER REFERENCES treasure(id),
	CONSTRAINT treasure_track_pk PRIMARY KEY (track_id, treasure_id)
);
