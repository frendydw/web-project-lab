<%@include file="../../model/Product.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer id = Integer.parseInt(request.getParameter("product_id")),
        quantity = Integer.parseInt(request.getParameter("quantity")),
        quantity_temp = Integer.parseInt(request.getParameter("quantity_temp"));
    Integer stock = 0;
    Integer quantity_new = quantity_temp - quantity;

    Product product = new Product().find(id);
    String text = request.getParameter("text");
    String message = "Successfully "+ text +" Product!!";

    stock = product.getStock();

	product.setStock(stock + quantity_new);
    
    product.update();



    response.sendRedirect("/AquaPets/web/layout/detail-product.jsp?id=" + id + "&status=success&message="+message);
%>

