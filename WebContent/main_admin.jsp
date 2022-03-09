<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<title>게임 리뷰 커뮤니티</title>
<style type="text/css">
body {
	background-color: rgb(9, 50, 65);
}

#black {
	background-color: rgb(4, 19, 26);
}

header {
	height: 60vw;
	background-image: url("./resources/images/headerback.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}

#mainmenu {
	border: 1px solid rgb(42, 79, 105);
	border-radius: 3px;
	background-color: rgb(54, 95, 126);
	width: 690px;
	position: relative;
	margin-top: 50px;
	float: right;
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
#adminMenu{
background-color:rgb(233, 233, 233);
width:700px;
margin:0 auto;
padding:30px;
padding-top:30px;
height: auto;
margin-top:50px;
margin-bottom:50px;
overflow:hidden;
}
#adminMenu button{
width:200px;
margin:0 auto;
margin-top:20px;
margin-bottom:20px;
}
button a{
color: white;
}
div~ p{
text-align:center;}
@media screen and (max-width:767px){
#adminMenu{
width:auto;
margin:50px 30px 30px 50px auto;
}
}

</style>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@include file="menu_admin.jsp"%>
	<div id="adminMenu">
		<p><h1 style="text-align:center"><fmt:message key="adminMenu"/></h1>
		<div class="text-right">
		<a href="?language=ko">한국어</a>| <a href="?language=en">English</a>
		</div>
		<hr>
		<p><a href="./addGame.jsp" class="btn btn-primary" role="button"><fmt:message key="addGame2"/> &raquo;</a>
		<p><a href="./editGame.jsp?edit=update" class="btn btn-secondary" role="button"><fmt:message key="updateGame"/> &raquo;</a>
		<p><a href="./editGame.jsp?edit=delete" class="btn btn-danger" role="button"><fmt:message key="deleteGame"/>&raquo;</a>
	</div>
	<%@include file="footer.jsp"%>
	</fmt:bundle>
</body>
</html>