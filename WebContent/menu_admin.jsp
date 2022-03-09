<%@ page contentType="text/html; charset=utf-8" %>
	<nav class="navbar navbar-expand-sm navbar-dark" id="black">
		<div class="container">
			<a href="main_admin.jsp" class="navbar-brand">
				<img src="./resources/images/icon.png" alt="" width="50"></a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-3">
					<a href="watchedlist.jsp" class="nav-link">
						<i class="fas fa-user"></i> <fmt:message key="admin"/>
					</a>
					<li class="nav-item">
						<a href="logout.jsp" class="nav-link">
							<i class="fas fa-user-times"></i> <fmt:message key="logout"/>
						</a>
					</li>
				</li>
			</ul>
		</div>
	</nav>