<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
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
	height: 60vw;
	background-image: url("./resources/images/headerback.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
</style>
</head>
<body>
<%@include file="menu.jsp" %>
	<div class="container" align="center" style="background-color:rgb(233,233,233);padding:10px;margin-top:30px;">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form class="form-sigin" action="loginAction.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User ID</label>
					<input type="text" class="form-control" placeholder="ID" name="userID" required autofocus />
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="userPassword" required/>
				</div>
				<button class="btn btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<p><a href="join.jsp">회원가입</a>
				<p><a href="main_admin.jsp">관리자 로그인</a>
			</form>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>