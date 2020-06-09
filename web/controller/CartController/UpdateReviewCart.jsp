<%@include file="../../model/Cart.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer user_id = 0;
    Integer product_id = 0;
    String review = "";
    try {
        user_id = Integer.parseInt((String)session.getAttribute("user_id"));
        product_id = Integer.parseInt(request.getParameter("product_id"));
        review = request.getParameter("review");

        new Cart().updateReview(review, user_id, product_id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/AquaPets/web/layout/detail-product.jsp?id="+product_id+"&status=success&message=Review Updated!");
%>
