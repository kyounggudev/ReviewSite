<head>
<style type="text/css">
	.dropdown-menu li a{
	text-decoration:none;
	}
	.dropdown-menu li a div{
	color:white;
	width:100%;
	}
	.dropdown-menu li a div:hover{
	background-color:white;
	color:black;
	text-decoration:none;
	}
	@media screen and (max-width:767px){
	#mainmenu{
	width:auto;
	margin:0 auto;
	margin-top:50px;
	}
	#search{
	margin:0;
	width:200px;
	}
	#search_in{
	width:150px;
	}
	}
</style>
</head>
<header class="container">
		<nav class="nav" id="mainmenu">	
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle menubox"
					type="button" id="dropdownMenu1" data-toggle="dropdown"
					aria-expanded="true">
					Browse <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="./gamelist.jsp?genre=action"><div>Action</div></a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="./gamelist.jsp?genre=adventure"><div>Adventure</div></a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="./gamelist.jsp?genre=FPS"><div>FPS</div></a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="./gamelist.jsp?genre=RPG"><div>RPG</div></a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
						href="./gamelist.jsp?genre=horror"><div>Horror</div></a></li>
				</ul>
			</div>
			<span><a class="nav-item nav-link menubox" href="community.jsp">community</a></span>
			<span><a class="nav-item nav-link menubox" href="rank.jsp">ranking</a></span>
			<span id="search">
				<form id="search" name="search" align="right"
					style="margin-top: 6px;" method="get" action="searchlist.jsp"
					onsubmit="return keyword_check()">
					<input id="search_in" type="text" name="keyword"
						placeholder="Search...">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</span>
		</nav>
	</header>