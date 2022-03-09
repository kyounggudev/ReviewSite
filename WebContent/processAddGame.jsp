<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page errorPage="exceptionDuplicate.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "C:\\Users\\pc\\eclipse-workspace\\Term\\WebContent\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
		
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
			maxSize, encType, new DefaultFileRenamePolicy());
	
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
	
	String sql = "insert into game values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameId);
	pstmt.setString(2, name);
	pstmt.setString(3, developer);
	pstmt.setString(4, platform);
	pstmt.setString(5, engine);
	pstmt.setString(6, genre);
	pstmt.setString(7, releaseDate);
	pstmt.setString(8, grade);
	pstmt.setString(9, fileName);
	pstmt.setString(10, fileName_Thumb);

		pstmt.executeUpdate();
	
	if(pstmt !=null)
		pstmt.close();
	if(conn !=null)
		conn.close();
	response.sendRedirect("main_admin.jsp");
%>