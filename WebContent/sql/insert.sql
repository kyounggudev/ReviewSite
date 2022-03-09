INSERT INTO game VALUES('G001', '하프라이프:알릭스', 'Valve', 'Windows','source2', 'FPS', '2020/03/23','15', 'alyx.jpeg','alyx_thumb.jpg');
INSERT INTO game VALUES('G002', '바이오하자드 re:2', 'CAPCOM', 'Windows/PS4/XBOX ONE','RE engine', '액션', '2019/01/25','18', 'biohazard2_re.jpeg','biohazard2_re_thumb.jpeg');
INSERT INTO game VALUES('G003', '젤다의 전설:야생의 숨결', 'Nintendo', 'Nintendo Switch','RE engine', '어드벤처', '2018/02/01','12', 'zelda_breathOfTheWild.jpg','zelda_breathOfTheWild_thumb.jpeg');

delete from game;

UPDATE review SET gameID="G001" WHERE gameID="G0001";

select * from game;