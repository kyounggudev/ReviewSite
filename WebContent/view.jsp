<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="commu.Commu"%>
<%@ page import="commu.CommuDAO"%>
<%@ page errorPage="exceptionNoCommu.jsp" %>
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
#commu{
	background-color: rgb(233, 233, 233);
	width: 700px;
	margin: 0 auto;
	padding: 30px;
	padding-top: 30px;
	height: auto;
	margin-top: 50px;
	margin-bottom: 50px;
	overflow: hidden;
}
</style>
</head>
<body>
<%
int commuID = 0;
if (request.getParameter("commuID") != null) {
	commuID = Integer.parseInt(request.getParameter("commuID"));
}
if (commuID == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글 입니다.')");
	script.println("location.href = 'community.jsp'");
	script.println("</script>");
}

Commu commu = new CommuDAO().getCommu(commuID);

%>
	<%@ include file="menu.jsp" %>
	<header class="container">
		<nav class="nav" id="mainmenu">
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle menubox"
					type="button" id="dropdownMenu1" data-toggle="dropdown"
					aria-expanded="true">
					Browse <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Another action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Something else here</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Separated link</a></li>
				</ul>
			</div>
			<span><a class="nav-item nav-link menubox" href="community.jsp">community</a></span>
			<span><a class="nav-item nav-link menubox" href="rank.jsp">ranking</a></span>
			<span id="search">
				<form id="search" name="search" align="right"
					style="margin-top: 6px;" method="get" action="NextFile.jsp"
					onsubmit="return keyword_check()">
					<input id="search_in" type="text" name="keyword"
						placeholder="Search...">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</span>
		</nav>
	</header>
	<div class="container" id="commu">
		<div class="">
			<div style="width:100%"><h3><%= commu.getCommuTitle() %></h3>
				<div style="overflow:hidden">
					<span class="left"><h5><%= commu.getUserID() %></h5></span>
					<span class="right"><h6><%= commu.getCommuDate().substring(0, 11) + commu.getCommuDate().substring(11, 13) + "시"+ commu.getCommuDate().substring(14, 16) + "분"%></h6></span>
				</div>
			</div>
		</div>
		<hr style="margin:5px;">
		<div><%= commu.getCommuContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></div>
		<hr style="margin:5px;">
		<a href = "community.jsp" class="btn btn-primary">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(commu.getUserID())){
				%>
						<a href="updateCommu.jsp?commuID=<%= commuID %>" class="btn btn-primary">수정</a>
						<a href="#" onclick="deleteWrite()" class="btn btn-danger">삭제</a>
				<%					
					}
				%>

	</div>
	
	<%@ include file="footer.jsp" %>
	
<script type = "text/javascript">
	function deleteWrite(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href="deleteCommu.jsp?commuID=<%= commuID %>"
		}
	}
</script>
	
</body>
</html>