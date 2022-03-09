<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="commu.CommuDAO" %>
<%@ page import="commu.Commu" %>
<%@ page errorPage="exceptionNoBookId.jsp"%>
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

#addForm {
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
<script type="text/javascript">
	function updateWrite() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.update.submit();
		} 
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
<%
		int commuID = 0;
		if (request.getParameter("commuID") != null) {
			commuID = Integer.parseInt(request.getParameter("commuID"));
		}
		if (commuID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'comunity.jsp'");
			script.println("</script>");
		}
		Commu commu = new CommuDAO().getCommu(commuID);
		if (!userID.equals(commu.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'comunity.jsp'");
			script.println("</script>");				
		}
	%>
	<div class="container" id="addForm">
		<h1>게시글 작성</h1>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<form name="update" action="./updateAction.jsp?commuID=<%=commuID %>"
					class="from-forizontal" method="post" enctype="multipart.form-date">
					<div class="form-group row">
						<label class="col-sm-2">제목</label>
						<div class="col-sm-10">
							<input type="text" name="commuTitle" class="form-control" value="<%= commu.getCommuTitle() %>"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">내용</label>
						<div class="col-sm-10">
							<textarea name="commuContent" cols="80" rows="10"
								class="form-control"><%= commu.getCommuContent() %></textarea>
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="updateWrite()"class="btn btn-secondary pull-right" value="글수정" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>