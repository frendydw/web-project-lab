<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    String username = request.getParameter("username"),
        email = request.getParameter("email"),
        password = request.getParameter("password"),
        gender = request.getParameter("gender");
    Integer id = 0;

    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        e.printStackTrace();
    }

    User user = new User().find(id);
    
    
    user.setUsername(username);
    user.setEmail(email);
    user.setPassword(password);
    user.setGender(gender);

    user.update();

    response.sendRedirect("../../updateUser.jsp?id=" + id + "&status=success&message=Successfully Update User's Data");
%>