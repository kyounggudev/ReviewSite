<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String gameId = request.getParameter("id");

	String sql = "select * from game";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		sql = "delete from game where g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gameId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 게임이 없습니다");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editGame.jsp?edit=delete");
%>