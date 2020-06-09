<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>
<%@page import="javax.servlet.http.Cookie" %>

<%
    String username = request.getParameter("username"),
    	password = request.getParameter("password"),
        remember = request.getParameter("remember");

    String remember_me = "remember";

    User user = new User().findUsername(username);

    if (user != null) {

    	if (user.getPassword().equals(password)) {
            session.setAttribute("user_id", String.valueOf(user.getId()));
            session.setAttribute("user", user.getUsername());
            session.setAttribute("role", user.getRole());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("gender", user.getGender());
            session.setAttribute("password", user.getPassword());
            if (remember_me.equals(remember)) {
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(60*60*24);
                cookie.setPath( "/" );
                response.addCookie(cookie);
            }
			
	        response.sendRedirect("../../index.jsp");
    	} else {
        	response.sendRedirect("../../layout/login.jsp?status=danger&message=Wrong Password!");
    	} 
    } else {
        response.sendRedirect("../../layout/login.jsp?status=danger&message=Username Not Registered");
    }

%>

