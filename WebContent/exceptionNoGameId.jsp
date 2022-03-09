<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
#mainmenu {
	border: 1px solid rgb(42, 79, 105);
	border-radius: 3px;
	background-color: rgb(54, 95, 126);
	width: 690px;
	position: relative;
	margin:0 auto;
	margin-top: 50px;
}
#gameinfo{
background-color:rgb(6, 29, 37);
width:700px;
margin:0 auto;
padding:30px;
padding-top:30px;
height: 300px;
margin-bottom:50px;
color:rgb(233,233,233);
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

.dropdown:hover .dropdown-menu {
	background-color: gray;
	display: block;
	margin-top: 0;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="menu2.jsp" %>
	<div class="container" id="gameinfo">
		<h2 class="alert alert-danger">해당 게임이 존재하지 않습니다.</h2>
		<p><%=request.getRequestURL() %>?id=<%=request.getQueryString() %>
			<p> <a href="main.jsp" class="btn btn-secondary"> 돌아가기 &raquo;</a>
	</div>
	

	<%@ include file="footer.jsp" %>
</body>
</html>