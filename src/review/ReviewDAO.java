package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import review.Review;

public class ReviewDAO {
	private Connection conn;
	private ResultSet rs;


	public ReviewDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/term?&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String user = "root";
			String password = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() { //현재 시간
		String sql = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //db오류
	}

		public int getNext() { //reviewID 가져오기
			String sql = "SELECT reviewID FROM REVIEW ORDER BY reviewID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1;//첫 번째 게시물인 경우
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}

		//실제로 글을 작성하는 함수
		public int write(String userID, String gameID,String reviewContent, String reviewRec) { 
			String sql = "INSERT INTO REVIEW VALUES(?, ?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, userID);
				pstmt.setString(3, gameID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, reviewContent);
				pstmt.setInt(6, 1);
				pstmt.setString(7, reviewRec);
				return pstmt.executeUpdate();	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		
		
		
		
		
		public ArrayList<Review> getList(){ 
			String sql = "SELECT * FROM REVIEW WHERE reviewAvailable = 1 ORDER BY reviewID DESC";
			ArrayList<Review> list = new ArrayList<Review>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Review review = new Review();
					review.setReviewID(rs.getInt(1));
					review.setUserID(rs.getString(2));
					review.setGameID(rs.getString(3));
					review.setReviewDate(rs.getString(4));
					review.setReviewContent(rs.getString(5));
					review.setReviewAvailable(rs.getInt(6));
					review.setReviewRec(rs.getNString(7));
					list.add(review);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; 
		}
		
		public Review getReview(int reviewID) {
			String sql = "SELECT * FROM REVIEW WHERE reviewID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reviewID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Review review = new Review();
					review.setReviewID(rs.getInt(1));
					review.setUserID(rs.getString(2));
					review.setGameID(rs.getString(3));
					review.setReviewDate(rs.getString(4));
					review.setReviewContent(rs.getString(5));
					review.setReviewAvailable(rs.getInt(6));
					review.setReviewRec(rs.getNString(7));
					return review;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public int delete(int commuID) {
			String sql = "DELETE FROM REVIEW WHERE reviewID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);   
				pstmt.setInt(1, commuID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}

}
