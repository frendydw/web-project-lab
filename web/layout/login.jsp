<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
	<link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="../javascript/login.js"></script>

	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
	<script src="../resources/jquery/jquery.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
 <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" name="loginForm" class="form" action="../controller/UserController/LoginUser.jsp" onsubmit="return validateForm()" method="post">
                            <h3 class="text-center text-info" style="font-size:50px; font-weight: lighter;">Aqua Pets</h3>
                            <%
                             Cookie cookie = null;
                             Cookie[] cookies = null;
                             String username = "";
                             
                             // Get an array of Cookies associated with the this domain
                             cookies = request.getCookies();
                             
                             if( cookies != null ) {   
                                for (int i = 0; i < cookies.length; i++) {
                             
                                    cookie = cookies[i];

                                    if (cookie.getName().equals("username")) {
                                        username = cookie.getValue();
                                    }
                                }
                             }
                            %>
                            <div class="form-group">
                                <label for="username">Username </label>
                                <input type="text" name="username" id="username" class="form-control" placeholder="Username" value="<%=username%>">
                            </div>
                            <div class="form-group">
                                <label for="password">Password </label>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                            </div>
                            <label for="remember-me" class="text-info"><span class="mr-1">Remember me </span><input id="remember-me" name="remember" type="checkbox" value="remember"></label><br>
                            <div class="form-group text-center">
                                <button class="btn btn-info btn-md" role="button" type="submit">Sign In</button> 

                                <a class="btn btn-outline-secondary" href="../layout/register.jsp" role="button">Register</a>

                                

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

                            
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>