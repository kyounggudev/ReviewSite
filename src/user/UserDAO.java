package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {

		try {
			String url = "jdbc:mysql://localhost:3306/term?useSSL=false&serverTimezone=Asia/Seoul"; 
			String user = "root";
			String password = "1234";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace(); // ������ �������� ���
		}
	}

	public int login(String userID, String userPassword) {

		String sql = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				} else
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db����
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
	}




}

