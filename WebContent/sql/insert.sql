INSERT INTO game VALUES('G001', '����������:�˸���', 'Valve', 'Windows','source2', 'FPS', '2020/03/23','15', 'alyx.jpeg','alyx_thumb.jpg');
INSERT INTO game VALUES('G002', '���̿����ڵ� re:2', 'CAPCOM', 'Windows/PS4/XBOX ONE','RE engine', '�׼�', '2019/01/25','18', 'biohazard2_re.jpeg','biohazard2_re_thumb.jpeg');
INSERT INTO game VALUES('G003', '������ ����:�߻��� ����', 'Nintendo', 'Nintendo Switch','RE engine', '��庥ó', '2018/02/01','12', 'zelda_breathOfTheWild.jpg','zelda_breathOfTheWild_thumb.jpeg');

delete from game;

UPDATE review SET gameID="G001" WHERE gameID="G0001";

select * from game;