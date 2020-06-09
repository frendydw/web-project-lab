<%@include file="model/User.jsp" %>
<%@page import="java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
	<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
	<script src="resources/jquery/jquery.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<% 
		String user=(String)session.getAttribute("user"); 
		String role=(String)session.getAttribute("role");
	%> 
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<a class="navbar-brand text-white" href="/AquaPets/web/index.jsp">Aqua Pets</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<%
					if (role != null) {
						if (role.equals("user")) {
							%>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Catalog
									</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=All Categories">All Products</a>
										<div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Fish">Fish</a>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Accessories">Accessories</a>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Other">Other</a>
									</div>
								</li>
							<%
						}
						if (role.equals("admin")) {
						%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Manage
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp">Catalog</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/AquaPets/web/layout/manage-user.jsp">User</a>
									<a class="dropdown-item" href="/AquaPets/web/layout/manage-transaction.jsp">Transaction</a>
								</div>
							</li>
						<%
						}
					} else {
						%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Catalog
								</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=All Categories">All Products</a>
										<div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Fish">Fish</a>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Accessories">Accessories</a>
                                        <a class="dropdown-item" href="/AquaPets/web/layout/manage-product.jsp?product_category=Other">Other</a>
									</div>
							</li>
						<%
					}
					
				%>	
	
			</ul>
			<form class="form-inline my-2 my-lg-0" action="/AquaPets/web/layout/manage-product.jsp">
				<input class="form-control mr-sm-2 text-black" name="product_name" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0 text-black" type="submit">Search</button>
			</form>

			<form class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav mr-auto">
					<%
						if (role == null) {
							%>
								<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
									<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Hi, Guest
									</a>
								</li>
							<%
						} else if (role.equals("admin")) {
							%>
							<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Hi, <%=user
								%>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<div>
										<a class="dropdown-item" href="/AquaPets/web/layout/profile.jsp">Profile</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/AquaPets/web/session/logout.jsp">Logout</a>
									</div>
								</div>
							</li>
							<%
						} else {
							%>
								<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Hi, <%=user
								%>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<div>
										<a class="dropdown-item" href="/AquaPets/web/layout/profile.jsp">Profile</a>
										<a class="dropdown-item" href="/AquaPets/web/layout/view-cart.jsp">Cart</a>
										<a class="dropdown-item" href="/AquaPets/web/layout/manage-transaction.jsp">Transaction</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/AquaPets/web/session/logout.jsp">Logout</a>
									</div>
								</div>
							</li>
							<%
						}
					%>
					
				</ul>

				<%
					if (role == null) {
						%>
							<a class="btn btn-outline-light my-2 my-sm-0 text-black" href="/AquaPets/web/layout/login.jsp" role="button" style="width: 80px">Login</a>
						<%
					}
				%>
				

			</form>
		</div>
	</nav>

	<div class="welcome-header">
		<div class="jumbotron">
		  <p style="font-size:60px; font-weight: lighter;">Welcome to the Aqua World!</p>
		  <p style="font-size:20px; font-weight: lighter;">The place to statisfy all of your little aquatic friend's need</p>
		  <hr>
		  <p>Picking the right aquarium supplies can be one of the most interesting aspects of the hobby. Researching which aquarium supplies are best suited for the species being kept or the size of the tank can be a lot of fun. Browse our catalog to find the best supplies for yout fish tank</p>
		  <button class="btn btn-primary text-white">Learn more</button>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row">
			<div class="col border p-3">
				<p style="font-size:20px; font-weight: bold;">Purchase Fish</p>
				<p>With a wide variety of freshwater fish species available, we carry tropical fish as well as cold water fish that are perfect for planted tank setups or cute desktop aquarium</p>
				<a class="btn btn-primary text-white" role="button" href="/AquaPets/web/layout/manage-product.jsp?product_category=Fish">See Fish</a>
			</div>
			<div class="col border p-3 ml-4">
				<p style="font-size:20px; font-weight: bold;">Purchase Accessories</p>
				<p>Start dreaming of your new underwater world with a wide variety of small decorative fake plant that will liven your fish tank without needing extra care</p>
				<a class="btn btn-primary text-white" role="button" href="/AquaPets/web/layout/manage-product.jsp?product_category=Accessories">See Accessories</a>
			</div>
			<div class="col-md-2">
				<p style="font-size:20px; font-weight: bold;">Site Status</p>
				<p>Current date: <%= (new java.util.Date()).toLocaleString()%></p>
				<br>
				<p>Number of user: <%=new User().get().size()%> person</p>
				<br>
				<p>Logged user: <%if(user != null){%>1<%}else{%>0<%}%> person</p>
			</div>
		</div>
	</div>

	<footer>
		<p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
	</footer>
</body>
</html>