<jsp:include page="../model/Product.jsp" />

<jsp:include page="../model/Cart.jsp" />

<%@page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
    <link rel="stylesheet" href="../css/detail-product.css">
    <script type="text/javascript" src="../javascript/detail-product.js"></script>

    <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
    <script src="../resources/jquery/jquery.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<% 
		String user=(String)session.getAttribute("user"); 
		String role=(String)session.getAttribute("role");	

		String user_id=(String)session.getAttribute("user_id");
		Integer product_id = 0;
        product_id = Integer.parseInt(request.getParameter("id"));

        String name = "";
        String description = "";
        String category = "";
        String statusCart = "";
        String review = "";
        String src = "";
        Integer stock = 0;
        Integer price = 0;
        Integer quantity = 0;
	    Integer quantity_temp = 0;

        if (product_id > 0) {
            Product product = new Product().find(product_id);

            name = product.getName();
            description = product.getDescription();
            category = product.getCategory();
            stock = product.getStock();
            price = product.getPrice();
			src = "/AquaPets/web/images/" + product.getImagePath();
        }

        if (role != null) {
        	Cart cart = new Cart().findCart(Integer.parseInt(user_id), product_id);

	        if (cart != null) {
	        	quantity = cart.getQuantity();
	        	quantity_temp = quantity;
	    	} 

	    	Cart cartStatus = new Cart().findCartFinalized(Integer.parseInt(user_id), product_id);

	    	if (cartStatus != null) {
	    		statusCart = cartStatus.getStatus();
	    		review = cartStatus.getReview();
	    		if (review.equals("null")) {
	    			review = "";
	    		}
	    	}
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
	<div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-11">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">

                            <h3 class="text-center text-info" style="font-size:50px; font-weight: lighter;"><%=name%></h3>
                            <div class="row mt-4">
                				<div class="col-md-5 text-center">

								<img src="<%=src%>" height="200" width="300">
                				</div>
                				<div class="col-md-7">
                				<div class="form-group row">
	                                <div class="col-md-2">
	                                    <p for="description" class="">Description</p>
	                                </div>
	                                <div class="col-md-10">
	                                	<p>: <%=description%></p>
	                                </div>  
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-md-2">
	                                    <p for="category" class="">Category</p>
	                                </div>
	                                <div class="col-md-10">
	                                   	<p>: <%=category%></p>
	                                </div>  
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-md-2">
	                                    <p for="price" class="">Price</p>
	                                </div>
	                                <div class="col-md-10">
	                                   	<p>: <%=price%></p>
	                                </div>  
	                             
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-md-2">
	                                    <p for="stock" class="">Stock</p>
	                                </div>
	                                <div class="col-md-10">
	                                   	<p>: <%=stock%></p>
	                                </div>  
	                             
	                            </div>
                				</div>
                			</div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%
if (role == null) {
	%>
	</body>
	</html>
	<%
return;
}
%>
	
	<%
		if (role.equals("user")) {
			%>
    <div id="login">
        <div class="container mb-5">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-11">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="../controller/CartController/InsertCart.jsp" method="post">
                            <h3 class="text-info" style="font-size:30px;">Add to Cart</h3>

                            <a class="text-info" href="/AquaPets/web/layout/view-cart.jsp">Show my cart</a>

                            <div class="form-group row mt-2">
                             	<input type="hidden" name="user_id" value="<%= user_id %>">
                             	<input type="hidden" name="product_id" value="<%= product_id %>">
                             	<input type="hidden" name="quantity_temp" value="<%= quantity_temp %>">
                                <div class="col-md-3 mt-1">
                                    <p>Quantity</p>
                                </div>
                             	<div>
                             		<input type="number" name="quantity" id="quantity" class="form-control" placeholder="Quantity" min="0" max="<%=stock+quantity%>" value="<%=quantity%>">
                             	</div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Change">
                            </div>
                       
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
			<%
		}
	%>



    <%
    	if (statusCart.equals("Finalized") && role.equals("user")) {
    		%>
     <div id="login">
        <div class="container mb-5">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-11">
                    <div id="login-box" class="col-md-12">
                        <form name="detailProductForm" id="login-form" class="form" action="/AquaPets/web/controller/CartController/UpdateReviewCart.jsp" method="post" onsubmit = "return validateForm()">
                            <h3 class="text-info" style="font-size:30px;">Review</h3>
                            
                             <div class="form-group row">
                                <div class="col-md-3 mt-1">
                                    <p><%=user%></p>
                                </div>
                             	<div>
                             		<input type="hidden" name="product_id" value="<%= product_id %>">
                             		<input type="text" name="review" id="quantity"   class="form-control" value= "<%=review%>">
                             	</div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md">
                    
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    		<%
    	} else {
    		%>
     <div id="login">
        <div class="container mb-5">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-11">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form">
                            <h3 class="text-info" style="font-size:30px;">Review</h3>
                            
                            <%
                            	Vector<Cart> carts = new Cart().get();

                            	for (Cart cart : carts) {
                            		
                            		if (cart.getProductId() == product_id && cart.getStatus().equals("Finalized") && !cart.getReview().equals("null")) {
                            		User userCart = new User().find(cart.getUserId());
                            		String usernameCart = userCart.getUsername();
                            			%>
										<div class="form-group row">
			                                <div class="col-md-3 mt-1">
			                                    <p><%=usernameCart%></p>
			                                </div>
			                             	<div>
			                             		<p><%=cart.getReview()%></p>
			                             	</div>
			                            </div>
                            			<%
                            		}
                            	}
                            %>
                            

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>    			
    		<%
    	}
    %>
	<footer class="py-4 footer">
		<p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
	</footer>
</body>
</html>