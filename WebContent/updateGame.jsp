<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/54f312ab5f.js"
	crossorigin="anonymous"></script>
<title>게임 수정</title>
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
		var gameName = document.getElementById("gameName");
		var developer = document.getElementById("developer");
		var platform = document.getElementById("platform");
		var engine = document.getElementById("engine");
		var releaseDate = document.getElementById("releaseDate");
		var grade = document.getElementById("grade");
		var genre = document.getElementById("genre");
		
		if(!check (/^\d{4}[\/](0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])$/,releaseDate ,"[출시일]]\nYYYY/MM/dd 형식으로 입력하세요."))
			return false;
		
		if(gameName.value.length<1||developer.value.length<1||platform.value.length<1||engine.value.length<1){
			alert("입력되지 않은 항목이 존재합니다.");
			return false;
		}
		
		if(confirm("게임 등록하시겠습니까?")){
			document.updateGame.submit();
		} else{
			document.updateGame.reset();
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
<%
String gameId = request.getParameter("id");
%>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@ include file="menu_admin.jsp" %>
	
	<div class="container" id="addForm">
	<h1><fmt:message key="updateGame"/></h1>
	<div class="text-right">
		<a href="?language=ko&id=<%=gameId%>">한국어</a>| <a href="?language=en&id=<%=gameId%>">English</a>
	</div>
	<hr>
	<%@include file="dbconn.jsp" %>
	<%
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from game where g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gameId);
		rs = pstmt.executeQuery();
		if (rs.next()){
	%>
		<div class="row">
			<div class="col-md-12">
				<form name="updateGame" action="./processUpdateGame.jsp" class="from-forizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row" style="display:none;">
						<label class="col-sm-2"><fmt:message key="gameID"/></label>
						<div class="col-sm-10">
							<input type="text" id="gameID" name="gameId" class="form-control" value='<%=rs.getString("g_id")%>'/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="gameName"/></label>
						<div class="col-sm-10">
							<input type="text" id="gameName" name="gameName" class="form-control"value='<%=rs.getString("g_name")%>'/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="developer"/></label>
						<div class="col-sm-10">
							<input type="text" id="developer" name="Developer" class="form-control"value='<%=rs.getString("g_developer")%>'/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="platform"/></label>
						<div class="col-sm-10">
							<input type="text" id="platform" name="platform" class="form-control"value='<%=rs.getString("g_platform")%>'/>
						</div>
					</div>				
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="engine"/></label>
						<div class="col-sm-10">
							<input type="text" id="engine" name="engine" class="form-control"value='<%=rs.getString("g_engine")%>'/>
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="genre"/></label>
						<div class="col-sm-10">
							<input type="text" id="genre" name="genre" class="form-control"value='<%=rs.getString("g_genre")%>'/>
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
						<div class="col-sm-10">
							<input type="text" id="releaseDate" name="releaseDate" class="form-control"value='<%=rs.getString("g_releaseDate")%>'/>
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="grade"/></label>
						<div class="col-sm-10">
							<input type="radio" name="grade" value ="all" checked="checked"/><img src="./resources/images/all.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" name="grade" value ="12" /><img src="./resources/images/12.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" name="grade" value ="15" /><img src="./resources/images/15.png" alt="image" style="wdith:40px;height:40px;" />
							<input type="radio" name="grade" value ="18" /><img src="./resources/images/18.png" alt="image" style="wdith:40px;height:40px;" />
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
							<input type="button" onclick="addGame()" class="btn btn-secondary" value="<fmt:message key="update"/>" />
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	%> %>
	</fmt:bundle>
	<%@ include file="footer.jsp" %>
</body>
</html>