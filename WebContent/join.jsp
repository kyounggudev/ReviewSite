<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>게임 커뮤니티</title>
<script>
function CheckJoinUser(){
	var userID = document.getElementById("userID");
	var userPassword = document.getElementById("userPassword");
	var userName = document.getElementById("userName");
	
	if(!check (/^[0-9|a-z]{4,11}$/, userID,"[아이디]\n영어 소문자와 숫자를 조합하여 4~11자까지 입력하세요."))
		return false;
	
	if(!check (/^[0-9|a-z|A-Z]{4,11}$/, userPassword,"[비밀번호]\n영어와 숫자를 조합하여 4~11자까지 입력하세요."))
		return false;
	if(!check (/^[0-9|a-z|가-힣]{2,6}$/, userName,"[이름]\n한글과 영어,숫자를 조합하여 2~6자까지 입력하세요.")){
		name.select();
		name.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		if (regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newUser.submit();
}
</script>
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
			<h3 class="form-signin-heading">회원가입</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form name="newUser"class="form-sigin" action="joinAction.jsp" method="post">
				<div class="form-group">
					<label for="inputUserID" class="sr-only">User ID</label>
					<input type="text" class="form-control" placeholder="ID" id="userID" name="userID" required autofocus />
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" id="userPassword" name="userPassword" required/>
				</div>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="user Name" id="userName" name="userName" required/>
				</div>
				<input type="button" class="btn btn-primary btn-block" value="등록" onclick="CheckJoinUser()"/>
			</form>
		</div>
	</div>
	<%@include file="footer.jsp" %>

</body>
</html>
