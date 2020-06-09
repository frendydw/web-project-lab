<%@include file="../../model/Model.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    String status = "";

    status = request.getParameter("status");

    Integer user_id = Integer.parseInt((String)session.getAttribute("user_id"));

    Transaction transaction = new Transaction();
    
    transaction.setUserId(user_id);
    transaction.setStatus(status);

    transaction.insert();

    new Cart().updateTransaction(user_id, transaction.last().getId());

    response.sendRedirect("/AquaPets/web/layout/view-cart.jsp?status=success&message=Carts Updated!");
%>

