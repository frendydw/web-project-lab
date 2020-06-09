<%@include file="../../model/Cart.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer user_id = 0;
    String status = "";
    try {
        user_id = Integer.parseInt((String)session.getAttribute("user_id"));
        status = request.getParameter("statusCart");

        new Cart().updateStatus(user_id, status);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/AquaPets/web/controller/TransactionController/InsertTransaction.jsp?status=Pending");
%>
