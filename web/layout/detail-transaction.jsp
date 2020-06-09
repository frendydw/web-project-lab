<%@include file="../model/Model.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

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
        String user_id=(String)session.getAttribute("user_id");
        Integer subtotal = 0;
	%> 
	<%
        if (role == null) {
        %>
            You are not authorized for this page!
            <a href="/AquaPets/web/index.jsp">Back to Home</a>
        <%
        return;
        }
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
    <%
    	Integer transaction_id = Integer.parseInt(request.getParameter("transaction_id"));
        Vector<Cart> carts = new Cart().findTransaction(transaction_id);
    %>

    <%
        if (carts.size() == 0) {
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
            <div class="text-center p-5">

        <p style="font-size: 30px">Your cart is empty!</p>
        <a class="btn btn-primary" href="/AquaPets/web/layout/manage-product.jsp" role="button">Product List</a>
        <a class="btn btn-success" href="/AquaPets/web/layout/manage-transaction.jsp" role="button">View Transaction List</a>

    </div>
    
        <%
        return;
        }
    %>

	<div class="container-fluid">
		<div class="mt-4">
			<h3 class="text-info" style="font-size:30px; font-weight: lighter;">Transaction Detail</h3>
		</div>

		<table class="table mt-5">
		  <thead>
		    <tr>
		      <th scope="col">Image</th>
		      <th scope="col">Name</th>
		      <th scope="col">quantity</th>
		      <th scope="col">Price</th>
		      <th scope="col">Subtotal</th>
		    </tr>
		  </thead>
		  <tbody>

            <%
                for (Cart cart : carts) {
                    Product product = new Product().find(cart.getProductId());
                    %>
                        <tr>
                        <%
							String src = "/AquaPets/web/images/" + product.getImagePath();
						%>
						<td><img src="<%=src%>" height="200" width="300"></td>
							<%
								String link = "/AquaPets/web/layout/detail-product.jsp?id=" + product.getId();
							%>

							
                          <td><a href= <%=link%>><%= product.getName() %></a></td>
                          <td><%= cart.getQuantity() %></td>
                          <td><%= product.getPrice() %></td>
                          <td><%= product.getPrice() * cart.getQuantity() %></td>
                        </tr>
                    <%
                    subtotal = subtotal + product.getPrice() * cart.getQuantity();
                }
            %>
		  </tbody>
		</table>
        
        <%
        	if (role.equals("admin")) {
        		%>
        <div class="text-center">
            <p class="text-info">Total: <strong><%=subtotal%></strong></p>
            <%
            	String link = "/AquaPets/web/controller/TransactionController/ApproveTransaction.jsp?transaction_id=" + transaction_id;
            	Transaction transaction = new Transaction().find(transaction_id);
            	if (transaction.getStatus().equals("Pending")){
            		%>
            			<a class="btn btn-success btn-md text-white" role="button" href= <%=link%>>Approve</a>
            		<%
            	} else {
            		%>
            			<p class="text-info"><strong>Transaction Approved!!</strong></p>
            		<%
            	}
            %>
        </div>
        		<%
        	} else {
        		%>
        <div class="text-center">
            <p class="text-info">Total: <strong><%=subtotal%></strong></p>
            <%
            	Transaction transaction = new Transaction().find(transaction_id);
            	if (transaction.getStatus().equals("Pending")){
            		%>
            			<p class="text-danger"><strong>Transaction is Pending!!</strong></p>
            		<%
            	} else {
            		%>
            			<p class="text-success"><strong>Transaction Approved!!</strong></p>
            		<%
            	}
            %>
        </div>
        		<%
        	}
        %>

	</div>
	<footer class="py-4 footer">
		<p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
	</footer>
</body>
</html>