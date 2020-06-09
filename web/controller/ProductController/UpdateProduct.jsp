<%@ include file="../../model/Product.jsp" %>
<%@ page import="java.sql.*, java.util.*, javax.servlet.*, java.io.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
    String name = "",
        description = "",
        category = "",
        image_path = "";
    Integer price = 0,
        stock = 0;
    String username=(String)session.getAttribute("user");
    Integer id = Integer.parseInt(request.getParameter("product_id"));
    Product product = new Product().find(id);


    
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = getServletContext().getRealPath("") + File.separator + "/web/images/";
 
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
 
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("D:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();

         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fieldValue = fi.getString();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();

                if(sizeInBytes > 0) {
                    file = new File(filePath + product.last().getId() + "-" + username + "-" + fileName) ;
                    fi.write( file ) ;
                    image_path = product.last().getId() + "-" + username + "-" + fileName;
                    product.setImagePath(image_path);
                } else {
                    product.setImagePath(product.getImagePath());
                }

            }  else {
                String fieldName = fi.getFieldName();
                String fieldValue = fi.getString();
                if (fieldName.equals("name")) {
                    name = fieldValue;
                }
                if (fieldName.equals("description")) {
                    description = fieldValue;
                }
                if (fieldName.equals("category")) {
                    category = fieldValue;
                }
                if (fieldName.equals("stock")) {
                    stock = Integer.parseInt(fieldValue);
                }
                if (fieldName.equals("price")) {
                    price = Integer.parseInt(fieldValue);
                }
            }
      }
   }

    product.setName(name);
    product.setDescription(description);
    product.setCategory(category);
    product.setPrice(price);
    product.setStock(stock);

    product.update();

    response.sendRedirect("/AquaPets/web/layout/manage-product.jsp?id=" + id + "&status=success&message=Successfully Update Product's Data");
%>

