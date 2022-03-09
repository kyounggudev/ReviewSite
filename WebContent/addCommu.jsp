<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
	function addWrite() {
		if (confirm("글 작성을 끝내시겠습니까?")) {
			document.newWrite.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="container" id="addForm">
		<h1>게시글 작성</h1>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<form name="newWrite" action="./writeAction.jsp"
					class="from-forizontal" method="post" enctype="multipart.form-date">
					<div class="form-group row">
						<label class="col-sm-2">제목</label>
						<div class="col-sm-10">
							<input type="text" name="commuTitle" class="form-control" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">내용</label>
						<div class="col-sm-10">
							<textarea name="commuContent" cols="80" rows="10"
								class="form-control"></textarea>
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="addWrite()" class="btn btn-secondary pull-right" value="글쓰기" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>