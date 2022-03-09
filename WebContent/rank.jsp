<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="game.Game"%>
<%@ page import="review.Review" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page errorPage="exceptionNoGameId.jsp" %>
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
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@include file="menu2.jsp" %>
		<div class="container" id="intro">
		<div style="width: 200px; float: left">
			<h4>게임 순위</h4>
		</div>
	</div>
	<div id="main1" class="container">
		<%@ include file="dbconn.jsp" %>
		
	
	
		<%
		int Count=0;
		ReviewDAO reviewDAO = new ReviewDAO();
		ArrayList<Review> list = reviewDAO.getList();
		ArrayList<Game> listOfGames = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from game";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Count=0;
				Game temp= new Game();
				temp.setGameID(rs.getString("g_id"));
				temp.setGameName(rs.getString("g_name"));
				temp.setDeveloper(rs.getString("g_developer"));
				temp.setPlatform(rs.getString("g_platform"));
				temp.setEngine(rs.getString("g_engine"));
				temp.setGenre(rs.getString("g_genre"));
				temp.setReleaseDate(rs.getString("g_releaseDate"));
				temp.setGrade(rs.getString("g_grade"));
				temp.setFileName(rs.getString("g_fileName"));
				temp.setFileName_Thumb(rs.getString("g_fileName_Thumb"));
				for(int n=0;n<list.size();n++){
					if(list.get(n).getGameID().equals(rs.getString("g_id"))){
						if(list.get(n).getReviewRec().equals("Y"))
							++Count;
						if(list.get(n).getReviewRec().equals("N"))
							--Count;
					}
				}
				temp.setRec(Count);
				listOfGames.add(temp);
			}
				
			class PointDecending implements Comparator<Game> {
				 
			    @Override
			    public int compare(Game a, Game b) {
			        Integer temp1 = a.getRec();
			        Integer temp2 = b.getRec();
			        
			        return temp2.compareTo(temp1);
			    }
			}
			PointDecending pointDecending = new PointDecending();
	        Collections.sort(listOfGames, pointDecending);
			
			
		%>
		<div>
			<%
				for (int i = 0; i < listOfGames.size(); i++) {
				Game game = listOfGames.get(i);
			%>
			<div class="container" style="margin-bottom: 5px">
				<a href="./game.jsp?id=<%=game.getGameID() %>" class="" id="list"
					role="button">
					<div class="item" style="overflow: hidden;">
						<div class="left" style="width: 184">
							<img src="./resources/images/<%=game.getFileName_Thumb()%>"
								style="width: 184px; height:69px;" />
						</div>
						<div class="left" style="margin-left: 2px;">
							<h5 style="color: rgb(206, 206, 206); margin-bottom: 4px;"><%=game.getGameName() %></h5>
							<h6 style="font-size: 10px;color:rgb(98, 154, 197); text-align: left; margin-bottom: 0px;"><%=game.getGenre() %>
								<br>
								<br><h6 style="font-size:10px; color:rgb(98, 154, 197); margin:0;">점수:<%=game.getRec() %></h6>
							</h6>
						</div>
						<div class="right" style="line-height: 69px;">
							<p style="margin-bottom: 0px;"><img src="./resources/images/<%=game.getGrade()%>.png" style="width:50px; height:50px;"/>
							</p>
						</div>
					</div>
				</a>
			</div>
			<%} %>
		</div>

	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>