<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<title>게임 상세정보</title>
<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<style type="text/css">
body {
	background-color: rgb(9, 50, 65);
}

#black {
	background-color: rgb(4, 19, 26);
}

#main1 {
	position: relative;
	margin-top: 3px;
}


form button {
	border-radius: 5px;
	border: 1px solid rgb(42, 79, 105);
	background-color: rgb(51, 89, 117);
	color: rgb(233, 233, 233);
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

#addForm{
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

</style>
<script type = "text/javascript">
	function addGame(){
		var gameID = document.getElementById("gameID");
		var gameName = document.getElementById("gameName");
		var developer = document.getElementById("developer");
		var platform = document.getElementById("platform");
		var engine = document.getElementById("engine");
		var releaseDate = document.getElementById("releaseDate");
		var grade = document.getElementById("grade");
		var genre = document.getElementById("genre");
		if(!check (/^[G][0-9]{3}$/, gameID,"[게임 코드]\n게임 코드는 G로 시작하고 숫자만을 더하여 4자리를 입력해야합니다."))
			return false;
		
		if(!check (/^\d{4}[\/](0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])$/,releaseDate ,"[출시일]]\nYYYY/MM/dd 형식으로 입력하세요."))
			return false;
		
		if(gameName.value.length<1||developer.value.length<1||platform.value.length<1||engine.value.length<1){
			alert("입력되지 않은 항목이 존재합니다.");
			return false;
		}
		
		if(confirm("게임 등록하시겠습니까?")){
			document.newGame.submit();
		} else{
			document.newGame.reset();
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
	}
</script>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@ include file="menu_admin.jsp" %>
	
	<div class="container" id="addForm">
	<h1><fmt:message key="addGame"/></h1>
	<div class="text-right">
		<a href="?language=ko">한국어</a>| <a href="?language=en">English</a>
	</div>
	<hr>
		<div class="row">
			<div class="col-md-12">
				<form name="newGame" action="./processAddGame.jsp" class="from-forizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="gameID"/></label>
						<div class="col-sm-10">
							<input type="text" id="gameID" name="gameId" class="form-control"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="gameName"/></label>
						<div class="col-sm-10">
							<input type="text" id="gameName" name="gameName" class="form-control"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="developer"/></label>
						<div class="col-sm-10">
							<input type="text" id="developer" name="Developer" class="form-control"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="platform"/></label>
						<div class="col-sm-10">
							<input type="text" id="platform" name="platform" class="form-control"/>
						</div>
					</div>				
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="engine"/></label>
						<div class="col-sm-10">
							<input type="text" id="engine" name="engine" class="form-control"/>
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="genre"/></label>
						<div class="col-sm-10">
							<input type="radio" id="genre" name="genre" value ="액션" checked="checked"/>액션
							<input type="radio" id="genre" name="genre" value ="어드벤처" />어드벤처
							<input type="radio" id="genre" name="genre" value ="RPG" />RPG
							<input type="radio" id="genre" name="genre" value ="FPS" />FPS
							<input type="radio" id="genre" name="genre" value ="공포" />공포
							<input type="radio" id="genre" name="genre" value ="기타" />기타
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
						<div class="col-sm-10">
							<input type="text" id="releaseDate" name="releaseDate" class="form-control"/>
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="grade"/></label>
						<div class="col-sm-10">
							<input type="radio" id="grade" name="grade" value ="all" checked="checked"/><img src="./resources/images/all.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" id="grade" name="grade" value ="12" /><img src="./resources/images/12.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" id="grade" name="grade" value ="15" /><img src="./resources/images/15.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" id="grade" name="grade" value ="18" /><img src="./resources/images/18.png" alt="image" style="wdith:40px;height:40px;" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="gameImage"/></label>
						<div class="col-sm-5">
							<input type="file" name="gameImage" class="form-control" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="gameImage_Thumb"/></label>
						<div class="col-sm-5">
							<input type="file" name="gameImage_Thumb" class="form-control" />
						</div>
					</div>	
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="addGame()" class="btn btn-secondary" value="<fmt:message key="add"/>" />
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
</fmt:bundle>
	<%@ include file="footer.jsp" %>
</body>
</html>