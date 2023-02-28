-- количество исполнителей в каждом жанре;

SELECT name, COUNT(musician_id)
FROM musician_genre m
JOIN musical_genre q ON m.genre_id = q.id
GROUP BY name
ORDER BY COUNT(musician_id) DESC;

-- количество треков, вошедших в альбомы 2019-2020 годов;

SELECT COUNT(name)
FROM track f
JOIN album l ON  f.album = l.id
WHERE release BETWEEN '2019/01/01' AND '2020/12/31'

-- средняя продолжительность треков по каждому альбому;

SELECT title, AVG(diraction)
FROM track f
JOIN album l ON f.album = l.id
GROUP BY title;

-- все исполнители, которые не выпустили альбомы в 2020 году;

SELECT name
FROM musician
EXCEPT 
SELECT name
FROM musician_album
LEFT JOIN musician ON musician_album.musician_id = musician.id
LEFT JOIN album ON musician_album.album_id = album.id
WHERE release BETWEEN '2020/01/01' AND '2020/12/31'

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

SELECT DISTINCT(trs.name)
FROM treasure_track tt
JOIN track trk ON tt.track_id = trk.id
JOIN treasure trs ON tt.treasure_id = trs.id
JOIN musician_album ma ON trk.album = ma.musician_id
JOIN musician mus ON ma.musician_id = mus.id
WHERE mus.name = 'Miyagi & Эндшпиль';

-- название альбомов, в которых присутствуют исполнители более 1 жанра;

SELECT title
FROM musician_album ma
JOIN album al ON ma.album_id = al.id
JOIN musician_genre mg USING(musician_id)
GROUP BY title, mg.musician_id
HAVING COUNT(genre_id) > 1;

-- наименование треков, которые не входят в сборники;

SELECT name
FROM track t
LEFT JOIN treasure_track tt ON t.id = tt.track_id
WHERE track_id IS NULL;

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек 
--(теоретически таких треков может быть несколько);

SELECT mus.name,diraction
FROM track t
JOIN musician_album ma ON t.album = ma.album_id
JOIN musician mus ON ma.musician_id = mus.id
WHERE diraction = (SELECT MIN(diraction) FROM track);

-- название альбомов, содержащих наименьшее количество треков.
SELECT title, COUNT(name)
FROM track t
JOIN album al ON t.album = al.id
GROUP BY title
HAVING title = (
	SELECT title
	FROM track t
	JOIN album al ON t.album = al.id
	GROUP BY title
	ORDER BY COUNT(name)
	LIMIT 1
)
