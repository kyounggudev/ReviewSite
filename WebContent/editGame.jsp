<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="review.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<title>상품 편집</title>
<style type="text/css">
body {
	background-color: rgb(9, 50, 65);
}

#black {
	background-color: rgb(4, 19, 26);
}

header {
	height: 100px;
}

#mainmenu {
	border: 1px solid rgb(42, 79, 105);
	border-radius: 3px;
	background-color: rgb(54, 95, 126);
	width: 690px;
	position: relative;
	margin:0 auto;
	margin-top: 50px;
}

#search {
	position: relative;
	margin-left: 80px;
	float: right;
}

#search_in {
	border-radius: 5px;
	border: 1px solid rgb(42, 79, 105);
	background-color: rgb(51, 89, 117);
	color: rgb(233, 233, 233);
}

#intro {
	border-bottom: 5px solid rgb(98, 154, 197);
		width:700px;
	margion:0 auto;
	margin-top: 20px;
	overflow: hidden;
	
}

#intro div h4 {
	color: rgb(233, 233, 233);
	background-color: rgb(98, 154, 197);
	border-radius: 5px 5px 0 0;
	margin-bottom: 0px;
	border-bottom: 1px solid rgb(98, 154, 197);
	text-align: center;
}

#main1 {
	position: relative;
	width:700px;
	margion:0 auto;
	margin-top: 3px;
}

.menubox {
	border-right: 1px solid rgb(42, 79, 105);
	color: rgb(233, 233, 233);
}

.menubox a:hover {
	color: black;
}

.menubox:hover {
	transition-duration: 1s;
	background: rgb(233, 233, 233);
}

form button {
	border-radius: 5px;
	border: 1px solid rgb(42, 79, 105);
	background-color: rgb(51, 89, 117);
	color: rgb(233, 233, 233);
}

#list {
	height: 69px;
	width: 100%;
	padding-top: 0;
	border: 0;
}

.item {
	background-color: rgb(5, 27, 36);
}

.right {
	float: right;
}

.left {
	float: left;
}

.dropdown:hover .dropdown-menu {
	background-color: gray;
	display: block;
	margin-top: 0;
}
</style>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 게임을 삭제합니다!") == true)
			location.href = "./deleteGame.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
<%@ include file="menu_admin.jsp" %>
<div class="container" id="intro">
		<div style="width: 200px; float: left">
			<h4><fmt:message key="gameList"/></h4>
		</div>
	</div>
	<div class="text-right container" style="color:rgb(233,233,233); width:700px; margin:0 auto;">
		<a href="?language=ko&edit=<%=edit %>" style="color:rgb(233,233,233)">한국어</a>| <a href="?language=en&edit=<%=edit%>"style="color:rgb(233,233,233); ">English</a>
	</div>
	<%@ include file="dbconn.jsp" %>
	<div id="main1" class="container">
		<div>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from game";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
					ReviewDAO reviewDAO = new ReviewDAO();
					ArrayList<Review> list = reviewDAO.getList();
					int Count=0;
					for(int n=0;n<list.size();n++){
						if(list.get(n).getGameID().equals(rs.getString("g_id"))){
							if(list.get(n).getReviewRec().equals("Y"))
								++Count;
							if(list.get(n).getReviewRec().equals("N"))
								--Count;
						}
					}
			%>
			<div class="container" style="margin-bottom: 5px">
				<a href="#" id="list"
					role="button">
					<div class="item" style="overflow: hidden;">
						<div class="left" style="width: 184">
							<img src="./resources/images/<%=rs.getString("g_fileName_Thumb")%>"
								style="width: 184px; height:69px;" />
						</div>
						<div class="left" style="margin-left: 2px;">
							<h5 style="color: rgb(206, 206, 206); margin-bottom: 4px;"><%=rs.getString("g_name")%></h5>
							<h6 style="font-size: 10px;color:rgb(98, 154, 197); text-align: left; margin-bottom: 0px;"><%=rs.getString("g_genre")%>
								<br>
								<br><h6 style="font-size:10px; color:rgb(98, 154, 197); margin:0;">점수:<%=Count %></h6>
							</h6>
						</div>
						<div class="right" style="line-height: 69px;">
							<p style="margin-bottom: 0px;"><img src="./resources/images/<%=rs.getString("g_grade")%>.png" style="width:50px; height:50px;"/>
							<p style="margin-bottom: 0px;">
								<%
								if(edit.equals("update")){
								%>
								<a href="./updateGame.jsp?id=<%=rs.getString("g_id")%>" class="btn btn-secondary" role="button" style="height:20px;font-size:10px;padding:0 10px 0 10px"><fmt:message key="update"/> &raquo;</a>
								<%
									}else if (edit.equals("delete")){
								%>
								<a href="#" onclick="deleteConfirm('<%=rs.getString("g_id")%>')" class="btn btn-danger" role="button" style="height:20px;font-size:10px;padding:0 10px 0 10px"><fmt:message key="delete"/> &raquo;</a>
								<%
								}
								%>
						</div>
					</div>
				</a>
			</div>
			<%
			}
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
			%>
		</div>

	</div>
</fmt:bundle>
	<%@ include file="footer.jsp"%></body>
</html>