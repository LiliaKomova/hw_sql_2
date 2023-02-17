INSERT INTO musical_genre 
VALUES
(1,'Hip - Hop'),
(2, 'Rock'),
(3, 'Blues'),
(4, 'Pop'),
(5, 'Country'),
(6, 'Reggae');

INSERT INTO musician 
VALUES
(1,'Machine Gun Kelly'), 
(2, 'Blackbear'), 
(3, 'Louna'), 
(4, 'Miyagi & Эндшпиль'),
(5, 'Halsey'), 
(6, 'John Mayer'), 
(7, 'Taylor Swift'), 
(8, 'Panic! At The Disco'), 
(9, 'Bob Marley');

INSERT INTO musician_genre
VALUES
(1,1),
(1,2),
(2,1),
(3,2),
(4,1),
(4,6),
(5,4),
(6,3),
(7,5),
(8,2),
(9,6);


INSERT INTO album 
VALUES
(1, 'Tickets to My Downfall', '2020/09/25'),
(2, 'Anonymous', '2019/04/26'),
(3, 'Полюса', '2018/04/24'),
(4, 'HATTORY', '2022/10/28'),
(5, 'Manic', '2020/01/17'),
(6, 'Battle Studies', '2009/11/17'),
(7, 'Lover', '2019/08/23'),
(8, 'Viva Las Vengence', '2022/08/19'),
(9, 'Uprising', '1980/06/10');

INSERT INTO musician_album
VALUES
(1,1),
(2,1),
(5,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,6),
(7,7),
(8,7),
(8,8),
(9,9);

INSERT INTO track
VALUES
(1, 'Forget Me Too', '00:02:45', 1),
(2, 'My Ex''s Best Friend', '00:02:18', 1), 
(3, 'Play This When I''m Gone', '00:03:22', 1),
(4, 'DOWN', '00:02:20', 2),
(5, 'HATE MY GUTS', '00:02:40', 2),
(6, 'DEAD BALLONS', '00:02:10', 2),
(7, 'Молодым', '00:04:37', 3),
(8, 'Выбор', '00:04:21', 3),
(9, 'Вечное', '00:04:15',3),
(10, 'Ночь', '00:03:08', 4),
(11, 'Временно', '00:03:45', 4),
(12, 'Need Me', '00:03:15', 4),
(13, 'Without Me', '00:03:21', 5),
(14, 'I Hate Everybody', '00:02:51', 5),
(15, 'Clementine', '00:03:54', 5),
(16, 'Perfectly Lonely', '00:04:28', 6),
(17, 'Half of My Heart', '00:04:10', 6), 
(18, 'Who Says', '00:02:56', 6),
(19, 'Paper Rings', '00:03:42', 7),
(20, 'ME!', '00:03:13', 7),
(21, 'I Forgot That You Existed', '00:02:51', 7),
(22, 'All by Youself', '00:04:18', 8),
(23, 'Say It Louder', '00:03:30', 8),
(24, 'Something About Maggie', '00:03:20', 8),
(25, 'Coming in From The Cold', '00:04:31', 9),
(26, 'Real Situation', '00:04:31', 9),
(27, 'Nothing Inside','00:02:52' , 1),
(28, 'kiss kiss', '00:02:18', 1);

INSERT INTO treasure
VALUES
(1, 'treasure № 1', '2023/02/11'),
(2, 'treasure № 2', '2022/12/02'),
(3, 'treasure № 3', '2021/08/04'),
(4, 'treasure № 4', '2020/11/15'),
(5, 'treasure № 5', '2022/10/21'),
(6, 'treasure № 6', '2020/09/07'),
(7, 'treasure № 7', '2022/09/12'),
(8, 'treasure № 8', '2023/01/02');

INSERT INTO treasure_track
VALUES
(1,1),
(13,1),
(14,1),
(2,2),
(5,2),
(6,2),
(3,3),
(8,3),
(9,3),
(15,4),
(20,4),
(21,4),
(19,5),
(23,5),
(24,5),
(4,6),
(18,6),
(16,6),
(25,7),
(11,7),
(27,7),
(10,8),
(26,8),
(12,8);
