<%@include file="../../model/Product.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer id = 0;
    try {
        id = Integer.parseInt(request.getParameter("id"));
        Product product = new Product();
        product.delete(id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/AquaPets/web/layout/manage-product.jsp?status=success&message=Product Deleted!");
%>
