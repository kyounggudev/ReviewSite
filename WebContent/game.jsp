<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import = "review.Review" %>
<%@ page import = "review.ReviewDAO" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page errorPage="exceptionNoGameId.jsp" %>
<%@ page import = "java.net.URLEncoder" %>
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
	margin:0 auto;
	margin-top: 20px;
	overflow: hidden;
	margin-bottom:10px;
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
#gameinfo{
background-color:rgb(6, 29, 37);
width:700px;
margin:0 auto;
padding:30px;
padding-top:30px;
height: auto;
overflow:hidden;
margin-bottom:50px;
}
.introduce tr{
border-bottom:1px solid rgb(183,183,183);
}
.introduce th{
background-color: rgb(54, 95, 126);
}
.introduce td{
color: black;
}
#estimation{
background-color:rgb(6, 29, 37);
border-top: 2px solid rgb(54, 95, 126);
width:700px;
margin:0 auto;
padding:30px;
margin-bottom:30px;
padding-top:5px;
padding-bottom:5px;
overflow:hidden;
height:auto;
}
#review{
background-color:   rgb(82, 99, 112);
width:700px;
margin:0 auto;
}

@media screen and (max-width:767px){
#info{
float:none;
margin:0 auto;
display: inline-block;
}
#gameImage{
float:none;
margin:0 auto;
display: inline-block;
}
#gameinfo{
width:auto;
margin:0 auto;
text-align:center;
max-width: 540px;
}
#estimation{
width:auto;
margin:0 auto;
margin-bottom:5px;
margin-top:5px;
max-width: 540px;
}


}

</style>
<script type = "text/javascript">
	function addReview(){
		if(confirm("리뷰를 등록하시겠습니까?")){
			document.newReview.submit();
		} else{
			document.newReview.reset();
		}
	}
</script>
</head>
<body>
<%@include file="dbconn.jsp" %>
	<%@ include file="menu.jsp" %>
	<%@include file="menu2.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");
	
	Cookie watchedID = new Cookie("watched_ID", URLEncoder.encode(request.getParameter("id"),"utf-8"));
	watchedID.setMaxAge(24*60*60);
	response.addCookie(watchedID);
			
	String id=request.getParameter("id");
	ReviewDAO reviewDAO = new ReviewDAO();
	ArrayList<Review> list = reviewDAO.getList();
	int yCount=0;
	int nCount=0;
	for(int n=0;n<list.size();n++){
		if(list.get(n).getGameID().equals(id)){
			if(list.get(n).getReviewRec().equals("Y"))
				++yCount;
			if(list.get(n).getReviewRec().equals("N"))
				++nCount;
		}
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from game where g_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	int cnt=0;
	if(rs.next()){
		++cnt;
	%>
	<div class="container" id="gameinfo">
		<div class="left" id="gameImage" style="border: 2px solid  rgb(54, 95, 126)">
			<div style="width:300px; height:auto; text-align:center; color:rgb(233, 233, 233);border:2px solid  rgb(54, 95, 126); background-color: rgb(70, 95, 126);">
			<h3><%=rs.getString("g_name") %></h3>
			</div>
			<img src="./resources/images/<%=rs.getString("g_fileName")%>" alt="image" style="width:300px; height:380px; border:2px solid  rgb(54, 95, 126)" />
		</div>
		<div class="right" id="info">
		<table class="introduce " style="width: 300px; background-color: rgb(233, 233, 233);border: 2px solid rgb(54, 95, 126); color: rgb(213, 213, 213); margin-top:50px; ">
                        <tr>
                        	<th>개발</th><td><%=rs.getString("g_developer") %></td>
                        </tr>
                        <tr>
                        	<th>플랫폼</th><td><%=rs.getString("g_platform") %></td>
                        </tr>
                        <tr>
                            <th>출시</th><td><%=rs.getString("g_releaseDate").substring(0,4)%>년 <%=rs.getString("g_releaseDate").substring(5,7)%>월 <%=rs.getString("g_releaseDate").substring(8,10) %>일</td>
                        </tr>
                        <tr>
                            <th>엔진</th><td><%=rs.getString("g_engine") %></td>
                        </tr>
                        <tr>
                            <th>장르</th><td><%=rs.getString("g_genre") %></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <th>심의등급</th><td><img src="./resources/images/<%=rs.getString("g_grade")%>.png" alt="" style="width:50px; height:50px;"class="inline"></td>
                        </tr>
                        <tr>
                        <td colspan="2" style="width:30px; background-color: rgb(70, 95, 126); padding:10px;  color:rgb(115, 165, 184)">
                        	<p><i class="fa fa-thumbs-up" style="color: rgb(39, 19, 221); font-size:30px; margin-right:10px;"></i> <%=yCount %>명이 추천합니다.
                        	<hr>
                        	<p style="margin:0;"><i class="fa fa-thumbs-down" style="color: rgb(209, 37, 37); font-size:30px;margin-right:10px;"></i> <%=nCount %>명이 비추천합니다.
                        </td>
                        </tr>
                    </table>
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
	%>
	<%
		int k=0;
		int r_id=0;
		for(int j=0;j<list.size();j++){
			if(list.get(j).getGameID().equals(id)&&list.get(j).getUserID().equals(userID)){
				k=1;
				r_id= list.get(j).getReviewID();
			}
				
		}
		if(userID!=null&&k==0){
	%>
	<div id="review" style="padding:5px;">
		<h3 style="color: rgb(118, 174, 217); ">해당 제품에 대한 평가 작성</h3>
		<hr style="border:2px solid rgb(62, 79, 92);">
		<form name="newReview" action="reviewAction.jsp?id=<%=id %>" style="padding:0 30px 0 30px;">
			<p><textarea name="reviewContent" cols="50" rows="5" class="form-control"></textarea>
			<p style="color:rgb(223,223,223)">
				<input type="radio" name="reviewRec" value="Y"checked="checked" />추천
				<input type="radio" name="reviewRec" value="N"/>비추천
				<input type="radio" name="id" value="<%=id %>" checked="checked" style="display:none;" />
				<input style ="color:Black; background-color:rgb(168, 204, 237); border-radius:5px;"class="right" type="button" value="리뷰 등록" onclick="addReview()"/>
		</form>
	</div>
	<%
		}
	%>
	
	<div class="container" id="intro">
		<div style="width: 200px; float: left">
			<h4>리뷰 리스트</h4>
		</div>
	</div>
	<%
		for(int i=0;i<list.size();i++){
			if(list.get(i).getGameID().equals(id)){
	%>

	<div id="estimation" style="display: flex;">
		<div class="left" style="color: rgb(183,183,183); width:200px order:1">
			<div >
				<p style="margin-bottom:2px;"><%=list.get(i).getUserID()%>
				<p style="margin-bottom:5px; font-size:5px;"><%=list.get(i).getReviewDate() %>
			</div>
			<%
			if(list.get(i).getReviewRec().equals("Y")){
			%>
			<div style="width:160px;background-color:rgb(6, 19, 27);padding:5px; border: 2px solid rgb(54, 95, 126);">
				<p style="margin-bottom:0px;"><i class="fa fa-thumbs-up" style="color: rgb(39, 19, 221); font-size:30px; margin-right:10px;"></i>추천합니다.
			</div>
			<%
				} else if(list.get(i).getReviewRec().equals("N")){
			%>
			<div style="width:160px;background-color:rgb(6, 19, 27);padding:5px; border: 2px solid rgb(54, 95, 126);">
				<p style="margin-bottom:0px;"><i class="fa fa-thumbs-down" style="color: rgb(209, 37, 37); font-size:30px; margin-right:10px;"></i>비추천합니다.
			</div>
			<%
				}
			%>
			<div>
				<p style="margin-bottom:2px;">
				<%
					if(userID != null && userID.equals(list.get(i).getUserID())){
				%>
						<a href="#" onclick="deleteReview()" class="btn btn-danger" style="height:20px;font-size:10px;padding:0 10px 0 10px">삭제</a>
				<%					
					}
				%>
			</div>
			
		</div>
		<div class="left" style="margin-left:5px; width:480px; hegiht:auto; overflow:hidden; order:2;border-left:2px solid rgb(163,163,163); padding:0 3px 0 3px;">
			<p style="color: rgb(213,213,213); "> <%=list.get(i).getReviewContent() %>
		</div>
	</div>
	
	<%} 
	}
	if(cnt==0){
		response.sendRedirect("game.jsp?"+id);
	}
	%>
	
	
	<%@ include file="footer.jsp" %>
	
	<script type = "text/javascript">
	function deleteReview(){
		if(confirm("리뷰를 삭제하시겠습니까?")){
			location.href="deleteReview.jsp?reviewID=<%=r_id%>&id=<%=id%>";
		}
	}
</script>
</body>
</html>