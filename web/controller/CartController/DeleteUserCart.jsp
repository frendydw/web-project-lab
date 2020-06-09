<%@include file="../../model/Model.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer user_id = 0;
    try {
        user_id = Integer.parseInt((String)session.getAttribute("user_id"));
        Vector<Cart> carts = new Cart().findCartUser(user_id);

        for (Cart cart : carts) {
            Product product = new Product().find(cart.getProductId());
            product.setStock(product.getStock() + cart.quantity);
            product.update();
        }

        new Cart().deleteUserCart(user_id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/AquaPets/web/layout/view-cart.jsp?status=success&message=Carts Emptied!");
%>