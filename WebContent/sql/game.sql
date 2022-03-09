CREATE TABLE IF NOT EXISTS game(
	g_id VARCHAR(20) NOT NULL,
	g_name VARCHAR(40),
	g_developer VARCHAR(40),
	g_platform VARCHAR(40),
	g_engine VARCHAR(20),
	g_genre VARCHAR(20),
	g_releaseDate VARCHAR(40),
	g_grade VARCHAR(10),
	g_fileName VARCHAR(30),
	g_fileName_Thumb VARCHAR(40),
	PRIMARY KEY (g_id)
)default CHARSET=utf8;

DROP TABLE game;