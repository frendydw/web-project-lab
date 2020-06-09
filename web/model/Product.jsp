<%@ include file="../connection/Connect.jsp" %>
<%@page import="java.util.*" %>

<%!
    public class Product {
        private Connect connect;

        private Integer id;
        private String name;
        private String description;
        private String category;
        private Integer price;
        private Integer stock;
        private String image_path;


        public Product() {

            this.connect = Connect.getConnection();
        }

        public Product(ResultSet resultSet) {

            this.connect = Connect.getConnection();
            
            try {
                this.id = resultSet.getInt("id");
                this.name = resultSet.getString("name");
                this.description = resultSet.getString("description");
                this.category = resultSet.getString("category");
                this.price = resultSet.getInt("price");
                this.stock = resultSet.getInt("stock");
                this.image_path = resultSet.getString("image_path");



            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }

        public void setName(String name) { this.name = name; }
        public String getName() { return name; }

        public void setDescription(String description) { this.description = description; }
        public String getDescription() { return description; }

        public void setCategory(String category) { this.category = category; }
        public String getCategory() { return category; }

        public void setPrice(Integer price) { this.price = price; }
        public Integer getPrice() { return price; }

        public void setStock(Integer stock) { this.stock = stock; }
        public Integer getStock() { return stock; }

        public void setImagePath(String image_path) { this.image_path = image_path; }
        public String getImagePath() { return image_path; }

        public Vector <Product> get() {
            Vector <Product> products = new Vector <Product>();
    
            try {
                String query = "SELECT * FROM products";

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    products.add(new Product(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return products;
        }

        public Vector <Product> getPagination(Integer offset) {
            Vector <Product> products = new Vector <Product>();
    
            try {
                String query = String.format("SELECT * FROM products LIMIT 5 offset %d", offset);

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    products.add(new Product(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return products;
        }

        public Product find(Integer id) {
            Product result = null;
    
            try {
                String query = String.format("SELECT * FROM products WHERE id = %d LIMIT 1", id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Product(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Vector <Product> findCategory(String category) {
            Vector <Product> products = new Vector <Product>();
    
            try {
                String query = String.format("SELECT * FROM products WHERE category='%s'", category);

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    products.add(new Product(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return products;
        }

        public Vector <Product> searchName(String name) {
            Vector <Product> products = new Vector <Product>();
    
            try {
                String query = String.format("SELECT * FROM products WHERE name like '%%%s%%'", name);

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    products.add(new Product(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return products;
        }


        public Product exists(String column, String value) {
            Product result = null;
            
            try {
                String query = String.format("SELECT * FROM products WHERE %s = '%s' LIMIT 1", column, value);

                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Product(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        public Product last() {
            Product result = null;
            
            try {
                String query = "SELECT * FROM products ORDER BY id DESC LIMIT 1";
                ResultSet resultSet = connect.executeQuery(query);            
    
                if (resultSet.next()) {
                    result = new Product(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Product insert() {
            try {
                String query = String.format("insert into products(name,description,category,price,stock, image_path)values('%s','%s','%s',%d, %d, '%s')", name, description, category, price, stock, image_path);
    
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return last();
        }

        public Product update() {
            try {
                String query = String.format("UPDATE products SET name = '%s', description = '%s', category = '%s', price = %d, stock = %d, image_path = '%s' WHERE id = %d", name, description, category, price, stock, image_path, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Boolean delete(Integer id) {
            Integer affected = 0;
            try {
                String query = String.format("DELETE FROM products WHERE id = %d", id);

                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }



    }
%>
