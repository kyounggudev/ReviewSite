package commu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommuDAO {
	private Connection conn;
	private ResultSet rs;


	public CommuDAO() {
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

		public int getNext() { //commuID 가져오기
			String sql = "SELECT commuID FROM COMMU ORDER BY commuID DESC";
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
		public int write(String commuTitle, String userID, String commuContent) { 
			String sql = "INSERT INTO COMMU VALUES(?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, commuTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, commuContent);
				pstmt.setInt(6,1);
				return pstmt.executeUpdate();	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		public ArrayList<Commu> getList(int pageNumber){ 
			String sql = "SELECT * FROM COMMU WHERE commuID < ? AND commuAvailable = 1 ORDER BY commuID DESC LIMIT 10";
			ArrayList<Commu> list = new ArrayList<Commu>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Commu commu = new Commu();
					commu.setCommuID(rs.getInt(1));
					commu.setCommuTitle(rs.getString(2));
					commu.setUserID(rs.getString(3));
					commu.setCommuDate(rs.getString(4));
					commu.setCommuContent(rs.getString(5));
					commu.setCommuAvailable(rs.getInt(6));
					list.add(commu);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; 
		}
		
		public boolean nextPage (int pageNumber) {
			String sql = "SELECT * FROM COMMU WHERE commuID < ? AND commuAvailable = 1 ORDER BY commuID DESC LIMIT 10";
			ArrayList<Commu> list = new ArrayList<Commu>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false; 		
		}
		
		public Commu getCommu(int commuID) {
			String sql = "SELECT * FROM COMMU WHERE commuID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, commuID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Commu commu = new Commu();
					commu.setCommuID(rs.getInt(1));
					commu.setCommuTitle(rs.getString(2));
					commu.setUserID(rs.getString(3));
					commu.setCommuDate(rs.getString(4));
					commu.setCommuContent(rs.getString(5));
					commu.setCommuAvailable(rs.getInt(6));
					return commu;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public int update(int commuID, String commuTitle, String commuContent) {
			String sql = "UPDATE COMMU SET commuTitle = ?, commuContent = ? WHERE commuID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, commuTitle);
				pstmt.setString(2, commuContent);
				pstmt.setInt(3, commuID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		public int delete(int commuID) {
			String sql = "DELETE FROM COMMU WHERE commuID = ?";
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
