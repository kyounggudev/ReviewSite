package game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Game {
	String gameID;
	String gameName;
	String developer;
	String platform;
	String engine;
	String genre;
	int rec;
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	String releaseDate;
	String grade;
	String fileName;
	String fileName_Thumb;
	public String getGameID() {
		return gameID;
	}
	public void setGameID(String gameID) {
		this.gameID = gameID;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getEngine() {
		return engine;
	}
	public void setEngine(String engine) {
		this.engine = engine;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName_Thumb() {
		return fileName_Thumb;
	}
	public void setFileName_Thumb(String fileName_Thumb) {
		this.fileName_Thumb = fileName_Thumb;
	}

	public ArrayList<Game> sort(ArrayList<Game> listOfGames){
		Collections.sort(listOfGames, comparator);
		return listOfGames;
	}
	
	Comparator<Game> comparator = new Comparator<Game>() {
	    @Override
	    public int compare(Game a, Game b) {
	        return a.getRec() - b.getRec();
	    }
	};
}
