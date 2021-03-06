package review;

public class Review {
	private int reviewID;
	private String userID;
	private String gameID;
	public String getGameID() {
		return gameID;
	}
	public void setGameID(String gameID) {
		this.gameID = gameID;
	}
	private String reviewDate;
	private String reviewContent;
	private int reviewAvailable;
	private String reviewRec;
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewAvailable() {
		return reviewAvailable;
	}
	public void setReviewAvailable(int reviewAvailable) {
		this.reviewAvailable = reviewAvailable;
	}
	public String getReviewRec() {
		return reviewRec;
	}
	public void setReviewRec(String reviewRec) {
		this.reviewRec = reviewRec;
	}
}
