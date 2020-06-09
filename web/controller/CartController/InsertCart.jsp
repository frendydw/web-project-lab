<%@include file="../../model/Cart.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer user_id = Integer.parseInt(request.getParameter("user_id")),
        product_id = Integer.parseInt(request.getParameter("product_id")),
        quantity = Integer.parseInt(request.getParameter("quantity")),
        quantity_temp = Integer.parseInt(request.getParameter("quantity_temp"));

    Cart cart = new Cart().findCart(user_id, product_id);
    String text = "";

    if (cart == null) {
    	if (quantity > 0) {
    		Cart cartNew = new Cart();
	    
		    cartNew.setUserId(user_id);
		    cartNew.setProductId(product_id);
		    cartNew.setQuantity(quantity);

		    cartNew.insert();
		    text = "Added";
    	} else {
    		text = "Do nothing to ";
    	}
	} else {
		if (quantity == 0) {
			cart.delete(cart.getId());
			text = "Deleted";
		} else {
			cart.setId(cart.getId());
			cart.setQuantity(quantity);
			cart.updateQuantity();
			text = "Updated";
		}	
	}
    

    response.sendRedirect("/AquaPets/web/controller/ProductController/StockUpdate.jsp?product_id=" + product_id + "&quantity=" + quantity + "&quantity_temp=" + quantity_temp + "&text=" + text);
%>

