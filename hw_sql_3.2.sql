SELECT name, release 
FROM album
WHERE release >= '2018-01-01' AND release <='2018-12-31';


SELECT name, diraction 
FROM track
ORDER BY diraction DESC
LIMIT 1;


SELECT name 
FROM track
WHERE diraction >='00:03:30';


SELECT name 
FROM treasure
WHERE release BETWEEN '2018/01/01' AND '2020/12/31';


SELECT name 
FROM musician
WHERE name NOT LIKE '% %';


SELECT name 
FROM track
WHERE name  ILIKE '%my%';
