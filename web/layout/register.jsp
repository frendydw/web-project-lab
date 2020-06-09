<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>
    <link rel="stylesheet" href="../css/register.css">
    <script type="text/javascript" src="../javascript/register.js"></script>


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
                        <form id="login-form" class="form" name="registerForm" onsubmit="return validateForm()" action="../controller/UserController/InsertUser.jsp" method="post">
                            <h3 class="text-center text-info" style="font-size:50px; font-weight: lighter;">Aqua Pets</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username </label>
                                <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label for="email" class="text-info">Email </label>
                                <input type="text" name="email" id="email" class="form-control" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password </label>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="cpassword" class="text-info">Confirm Password </label>
                                <input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="Confirm Password">
                            </div>
                            <div class="form-group">
                                <label for="gender" class="text-info mr-5">Gender </label>
                                <input type="radio" name="gender" value="male"> Male
                                <input type="radio" name="gender" value="female"> Female
                            </div>
             
                            <div class="form-group text-center">
                                <button class="btn btn-info btn-md">Register</button>
                                <a class="btn btn-outline-secondary" href="../" role="button">Cancel</a>
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