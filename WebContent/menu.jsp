

<%
	//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<%@ page contentType="text/html; charset=utf-8" %>
	<nav class="navbar navbar-expand-sm navbar-dark" id="black">
		<div class="container">
			<a href="main.jsp" class="navbar-brand">
				<img src="./resources/images/icon.png" alt="" width="50"></a>
			<%
				if(userID != null){ //로그인 된 경우
			%>
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-3">
					<a href="watchedlist.jsp" class="nav-link">
						<i class="fas fa-user"></i><%=userID %>
					</a>
					<li class="nav-item">
						<a href="logout.jsp" class="nav-link">
							<i class="fas fa-user-times"></i> Logout
						</a>
					</li>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-3">
					<a href="login.jsp" class="nav-link">
						<i class="fas fa-user"></i> 로그인
					</a>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>