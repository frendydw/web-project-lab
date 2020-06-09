<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer id = 0;
    try {
        id = Integer.parseInt(request.getParameter("id"));
        new User().delete(id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/AquaPets/web/layout/manage-user.jsp?status=success&message=User Deleted!");
%>
