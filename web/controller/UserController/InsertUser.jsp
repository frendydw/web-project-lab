<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    String username = request.getParameter("username"),
        email = request.getParameter("email"),
        password = request.getParameter("password"),
        gender = request.getParameter("gender");

    User user = new User();
    
    if (user.exists("username", username) != null) {
        response.sendRedirect("../../layout/register.jsp?status=danger&message=Username Already Taken");
        return;    
    }

    if (user.exists("email", email) != null) {
        response.sendRedirect("../../layout/register.jsp?status=danger&message=Email Already Taken");
        return;    
    }

    session.setAttribute("user",username); 

    
    user.setUsername(username);
    user.setEmail(email);
    user.setPassword(password);
    user.setGender(gender);

    user.insert();

    response.sendRedirect("../../session/register.jsp");
%>

