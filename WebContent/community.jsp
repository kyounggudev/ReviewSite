<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="commu.CommuDAO" %>
<%@ page import="commu.Commu" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page errorPage="exceptionNoGameId.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<title>게임 상세정보</title>
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
	margin: 0 auto;
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
	width: 700px;
	margin: 0 auto;
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
#write{
	width: 700px;
	margin: 0 auto;
	overflow: hidden;
}
#main1 {
	position: relative;
	width: 700px;
	margion: 0 auto;
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

#bar {
	width: 700px;
	margin: 0 auto;
	border: 1px solid rgb(42, 79, 105);
	background-color: rgb(54, 95, 126);
}

#commu {
	width: 700px;
	margin: 0 auto;
	background-color: rgb(233, 233, 233);
	overflow: hidden;
}
</style>
</head>
<body>
	<%
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<%@ include file="menu.jsp"%>
	<%@include file="menu2.jsp" %>
	<div class="container" id="intro">
		<div style="width: 200px; float: left">
			<h4>게시판</h4>
		</div>
	</div>
	<div id="write" class="container">
		<div class="container" id="bar"
			style="padding: 0; overflow: hidden; border-bottom: 3px solid black;">
			<div class="left"
				style="width: 80%; margin: 0; border-right: 2px solid black; padding-left: 10px; color: rgb(233, 233, 233); text-align: center;">제목</div>
			<div class="left"
				style="width: 20%; margin: 0; padding-left: 10px; color: rgb(233, 233, 233)">작성자</div>
		</div>
		<%
			CommuDAO commuDAO = new CommuDAO();
			ArrayList<Commu> list = commuDAO.getList(pageNumber);
			for(int i=0;i<list.size();i++){
		%>
		<div class="container" id="commu"
			style="padding: 0; overflow: hidden; border-bottom: 2px solid black;">
			<div class="left"
				style="width: 80%; margin: 0; border-right: 2px solid black; padding-left: 10px; color: black"><a href="view.jsp?commuID=<%=list.get(i).getCommuID()%>"><%=list.get(i).getCommuTitle() %></a></div>
			<div class="left"
				style="width: 20%; margin: 0; padding-left: 10px; color: black"><%=list.get(i).getUserID() %></div>
		</div>
		<%
			}
			if(pageNumber !=1){
		%>
		<a href="community.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arrow-left">이전</a>
		<%
			}
			if(commuDAO.nextPage(pageNumber+1)){
		%>
		<a href="community.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arrow-right">다음</a>
		<%
			}
		%>
		
		<div style="height: 20px;"></div>
		<%
			if (session.getAttribute("userID") != null) {
		%>
		<a href="addCommu.jsp" class="btn btn-secondary pull-right">글쓰기</a>
		<%
			}else{
		%>
		<button class="btn btn-secondary pull-right" onclick="if(confirm('로그인이 필요합니다. 하시겠습니까?'))location.href='login.jsp';" type="button" >글쓰기</button>
		<%
			}
		%>
	</div>

	<div style="height: 20px;"></div>
	<%@ include file="footer.jsp"%>
</body>
</html>