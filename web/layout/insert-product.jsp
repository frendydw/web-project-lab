<%@include file="../model/Product.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
    <link rel="stylesheet" href="../css/insert-product.css">
    <script type="text/javascript" src="../javascript/insert-product.js"></script>


    <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
    <script src="../resources/jquery/jquery.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <% 
        String user=(String)session.getAttribute("user"); 
        String role=(String)session.getAttribute("role");

        if (role == null || role.equals("user")) {
        %>
            You are not authorized for this page!
            <a href="/AquaPets/web/index.jsp">Back to Home</a>
        <%
        return;
        }
        Integer product_id = 0;
        product_id = Integer.parseInt(request.getParameter("id"));

        String name = "";
        String description = "";
        String category = "";
        String image_name = "";
        String src = "";
        Integer stock = 0;
        Integer price = 0;
        Integer id = 0;

        if (product_id > 0) {
            Product product = new Product().find(product_id);
            id = product.getId();
            name = product.getName();
            description = product.getDescription();
            category = product.getCategory();
            stock = product.getStock();
            price = product.getPrice();
            image_name = product.getImagePath();
            src = "/AquaPets/web/images/" + product.getImagePath();

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

     <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">     
                            <%
                                if (product_id == 0){
                                    %>
                                        <form id="insert-product-form" name="insertProductForm" class="form" onsubmit="return validateForm()" action="../controller/ProductController/InsertProduct.jsp" method="post" enctype = "multipart/form-data">
                                        <h3 class="text-center text-info mb-5" style="font-size:50px; font-weight: lighter;">Insert Product</h3>
                                    <%
                                } else {
                                    %>
                                     <form id="insert-product-form" name="insertProductForm" class="form" onsubmit="return validateForm()" action="../controller/ProductController/UpdateProduct.jsp?product_id=<%=id%>" method="post" enctype = "multipart/form-data">
                                        <h3 class="text-center text-info mb-5" style="font-size:50px; font-weight: lighter;">Update Product</h3>
                                    <%
                                }
                            %>
                            
                            <div class="form-group row">
                                <div class="col-md-2 mt-1">
                                    <p for="name" class="">Name</p>
                                </div>
                                <div class="col-md-10">
                                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" value="<%=name%>">
                                </div>  
                            </div>
                            <div class="form-group row">
                                <div class="col-md-2 mt-1">
                                    <p for="description" class="">Description</p>
                                </div>
                                <div class="col-md-10">
                                    <textarea class="form-control" rows="2" name="description"><%=description%></textarea>
                                </div>  
                            </div>
                            <div class="form-group row">
                                <div class="col-md-2 mt-1">
                                    <p for="category" class="">Category</p>
                                </div>
                                <div class="col-md-10">
                                    <select class="form-control" name="category">
                                        <%
                                            if (category != "") {
                                                %><option value="<%=category%>"><%=category%></option><%
                                            }
                                        %>
                                        <option value="Fish">Fish</option>
                                        <option value="Accessories">Accessories</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>  
                            </div>
                            <div class="form-group row">
                                <div class="col-md-2 mt-1">
                                    <p for="price" class="">Price</p>
                                </div>
                                <div class="col-md-10">
                                    <input type="number" name="price" id="price" class="form-control" placeholder="Price" min="0" value="<%=price%>">
                                </div>  
                            </div>
                            <div class="form-group row">
                                <div class="col-md-2 mt-1">
                                    <p for="stock" class="">Stock</p>
                                </div>
                                <div class="col-md-10">
                                    <input type="number" name="stock" id="stock" class="form-control" placeholder="Stock" min="0" value="<%=stock%>">
                                </div>  
                            </div>
                            <div class="form-group row">
                                <div class="col-md-2">
                                    <p for="image" class="">Image</p>
                                </div>

                                <%
                                    if (product_id == 0){
                                        %>
                                            <div class="col-md-10">
                                                <input type="file" name="image" id="image" placeholder="Choose File"  accept=".png, .jpg, .jpeg" >
                                            </div>  
                                        <%
                                    } else {
                                        %>
                                            <div class="col-md-10">
                                                <%=image_name%>
                                                <input type="file" name="image" id="image" placeholder="Choose File" accept=".png, .jpg, .jpeg" >
                                            </div>  
                                        <%
                                    }
                                %>
                                
                            </div>
                            <div class="form-group text-center">
                                <%
                                    if (product_id == 0) {
                                        %>
                                            <button class="btn btn-info btn-md" role="button" type="submit">Insert</button>

                                        <%
                                    } else {
                                        %>
                                            <button class="btn btn-info btn-md" role="button" type="submit">Update</button>
                                        <%
                                    }
                                %>
                                <a class="btn btn-outline-secondary" href="/AquaPets/web/layout/manage-product.jsp">Cancel</a>
                                <p class="mt-3">&copy;2020 Copyright: AquaPets</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>