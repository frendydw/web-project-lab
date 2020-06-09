<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
    <link rel="stylesheet" href="../css/change-password.css">
    <script type="text/javascript" src="../javascript/change-password.js"></script>


    <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
    <script src="../resources/jquery/jquery.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <% 
        String user=(String)session.getAttribute("user"); 
        String role=(String)session.getAttribute("role");
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

     <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="change-password-form" name="changePasswordForm" class="form" action="../controller/UserController/ChangePasswordUser.jsp" onsubmit="return validateForm()" method="post">
                            <h3 class="text-center text-info mb-5" style="font-size:50px; font-weight: lighter;">Aqua Pets</h3>
                            <div class="form-group row">
                                <div class="col-md-4 mt-1">
                                    <p for="name" class="">New Password</p>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="npassword" id="npassword" class="form-control" placeholder="New Password">
                                </div>  
                            </div>

                             <div class="form-group row">
                                <div class="col-md-4 mt-1">
                                    <p for="name" class="">Confirm Password</p>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="Confirm Password">
                                </div>  
                            </div>

                             <div class="form-group row">
                                <div class="col-md-4 mt-1">
                                    <p for="name" class="">Old Password</p>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="password" id="password " class="form-control" placeholder="Old Password">
                                </div>  
                            </div>

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
             
                            <div class="form-group text-center">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Save">
                                <a class="btn btn-outline-secondary" href="/AquaPets/web/index.jsp">Cancel</a>
                                <p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>