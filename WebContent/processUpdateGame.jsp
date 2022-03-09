<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\Users\\pc\\eclipse-workspace\\Term\\WebContent\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
		
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String gameId = multi.getParameter("gameId");
	String name = multi.getParameter("gameName");
	String developer = multi.getParameter("Developer");
	String platform = multi.getParameter("platform");
	String engine = multi.getParameter("engine");
	String genre = multi.getParameter("genre");
	String releaseDate = multi.getParameter("releaseDate");
	String grade = multi.getParameter("grade");
		
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName_Thumb = multi.getFilesystemName(fname);
	String fname2 = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname2);
		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from game where g_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null&&fileName_Thumb!=null){
			sql = "UPDATE game SET g_name=?, g_developer=?, g_platform=?, g_engine=?, g_genre=?, g_releaseDate=?, g_grade=?, g_fileName=?, g_fileName_Thumb=? WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, developer);
			pstmt.setString(3, platform);
			pstmt.setString(4, engine);
			pstmt.setString(5, genre);
			pstmt.setString(6, releaseDate);
			pstmt.setString(7, grade);
			pstmt.setString(8, fileName);
			pstmt.setString(9, fileName_Thumb);
			pstmt.setString(10, gameId);
			pstmt.executeUpdate();
		} else if(fileName == null&&fileName_Thumb!=null){
			sql = "UPDATE game SET g_name=?, g_developer=?, g_platform=?, g_engine=?, g_genre=?, g_releaseDate=?, g_grade=?, g_fileName_Thumb=? WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, developer);
			pstmt.setString(3, platform);
			pstmt.setString(4, engine);
			pstmt.setString(5, genre);
			pstmt.setString(6, releaseDate);
			pstmt.setString(7, grade);
			pstmt.setString(8, fileName_Thumb);
			pstmt.setString(9, gameId);
			pstmt.executeUpdate();
		} else if(fileName != null&&fileName_Thumb==null){
			sql = "UPDATE game SET g_name=?, g_developer=?, g_platform=?, g_engine=?, g_genre=?, g_releaseDate=?, g_grade=?, g_fileName=? WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, developer);
			pstmt.setString(3, platform);
			pstmt.setString(4, engine);
			pstmt.setString(5, genre);
			pstmt.setString(6, releaseDate);
			pstmt.setString(7, grade);
			pstmt.setString(8, fileName);
			pstmt.setString(9, gameId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE game SET g_name=?, g_developer=?, g_platform=?, g_engine=?, g_genre=?, g_releaseDate=?, g_grade=? WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, developer);
			pstmt.setString(3, platform);
			pstmt.setString(4, engine);
			pstmt.setString(5, genre);
			pstmt.setString(6, releaseDate);
			pstmt.setString(7, grade);
			pstmt.setString(8, gameId);
			pstmt.executeUpdate();
		}
	}
	if(rs!=null)
		rs.close();
	if(pstmt !=null)
		pstmt.close();
	if(conn !=null)
		conn.close();
	
	response.sendRedirect("editGame.jsp?edit=update");
%>