<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
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
</style>
<script type = "text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@include file="menu2.jsp" %>
	
	<%@ include file="footer.jsp" %>
</body>
</html>