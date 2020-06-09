<%@include file="../model/Product.jsp" %>
<%@page import="java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>

    <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
    <script src="../resources/jquery/jquery.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<% 
		String user=(String)session.getAttribute("user"); 
		String role=(String)session.getAttribute("role");
		String product_category = request.getParameter("product_category");
		if (product_category == null){
			product_category = "All Categories";
		}
		String product_name = request.getParameter("product_name");
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
	<div class="container-fluid">
		<form action="/AquaPets/web/layout/manage-product.jsp">
			<div class="row ml-2 mt-5">
				<div  class="col-md-1 p-1">
					<label for="cars">Category</label>
				</div>
				<div  class="col-md-2">
					<select name="product_category" class="form-control">
						<option value=<%=product_category%>><%=product_category%></option>
					 	<option value="All Categories">All Categories</option>
					  	<option value="Fish">Fish</option>
					    <option value="Accessories">Accessories</option>
					    <option value="Other">Other</option>
					</select>
				</div>
				<div  class="col">
					<input type="submit" value="Apply" class="btn btn-primary text-white">
				</div>
				
			</div>
		  
		  
		  
		</form>
			
		<%
			if (role != null && role.equals("admin")) {
				%>
					<div class="mt-4">
						<a href="/AquaPets/web/layout/insert-product.jsp?id=0">
							<button class="btn btn-primary text-white ml-2" type="button">
							Insert
							</button>
						</a>
					</div>
				<%
			}
		%>

		<%
		    String status = request.getParameter("status"),
		        message = request.getParameter("message");
		    if (status != null) {
		%>
		    <div class="m-2 text-center text-<%= status %>">
		        <strong><%= message %></strong>
		    </div>
		<%
		    }
		%>
		

		<table class="table mt-5">
		  <thead>
		    <tr>
		      <th scope="col">Image</th>
		      <th scope="col">Name</th>
		      <th scope="col">Category</th>
		      <th scope="col">Price</th>

		      <%
		      	if (role != null && role.equals("admin")) {
		      		%>
		      			<th scope="col">Action</th>
		      		<%

		      	}
		      %>
		    </tr>
		  </thead>
		  <tbody>
		    <%
		    	Vector<Product> products= null;

		    	if (product_category.equals("All Categories") || product_category.equals("All")){
		    		products = new Product().get();
		    	} else {
		    		products = new Product().findCategory(product_category);
		    	}

		    	if (product_name != null && !product_name.equals("")) {
		    		products = null;
		    		products = new Product().searchName(product_name);
		    	}

					for (Product product : products) {
				%>
					<tr>
						<%
							String src = "/AquaPets/web/images/" + product.getImagePath();
						%>
						<td><img src="<%=src%>" height="200" width="300"></td>

						<td>

							<%
								String link = "/AquaPets/web/layout/detail-product.jsp?id=" + product.getId();
							%>

							<a href= <%=link%>><%= product.getName() %></a>
						</td>

						<td><%= product.getCategory() %></td>

						<td><%= product.getPrice() %></td>

						<%
					      	if (role != null && role.equals("admin")) {
					      		%>
					      			<td class="col-action" width="18%">
										<form class="d-inline-block" action="/AquaPets/web/layout/insert-product.jsp">
											<input type="hidden" name="id" value="<%= product.getId() %>">
											<button class="btn btn-sm btn-success btn-action">Update</button>
										</form>
									
										<form class="d-inline-block" action="../controller/ProductController/DeleteProduct.jsp" method="POST">
											<input type="hidden" name="id" value="<%= product.getId() %>">
											<button class="btn btn-sm btn-danger btn-action">Delete</button>
										</form>
									</td>
					      		<%

					      	}
					    %>
					</tr>
				<%
					}
				%>
		  </tbody>
		</table>
	</div>
	<footer class="py-4 footer">
		<p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
	</footer>
</body>
</html>

