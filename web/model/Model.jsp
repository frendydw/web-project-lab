<%@ include file="../connection/Connect.jsp" %>
<%@page import="java.util.*" %>

<%!
    public class User {
        private Connect connect;

        private Integer id;
        private String username;
        private String email;
        private String password;
        private String gender;
        private String role;


        public User() {

            this.connect = Connect.getConnection();
        }

        public User(ResultSet resultSet) {

            this.connect = Connect.getConnection();
            
            try {
                this.id = resultSet.getInt("id");
                this.username = resultSet.getString("username");
                this.email = resultSet.getString("email");
                this.password = resultSet.getString("password");
                this.gender = resultSet.getString("gender");
                this.role = resultSet.getString("role");



            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }

        public void setUsername(String username) { this.username = username; }
        public String getUsername() { return username; }

        public void setEmail(String email) { this.email = email; }
        public String getEmail() { return email; }

        public void setPassword(String password) { this.password = password; }
        public String getPassword() { return password; }

        public void setGender(String gender) { this.gender = gender; }
        public String getGender() { return gender; }

        public void setRole(String role) { this.role = role; }
        public String getRole() { return role; }

        public Vector <User> get() {
            Vector <User> users = new Vector <User>();
    
            try {
                String query = "SELECT * FROM users";

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    users.add(new User(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return users;
        }

        public User find(Integer id) {
            User result = null;
    
            try {
                String query = String.format("SELECT * FROM users WHERE id = %d LIMIT 1", id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new User(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public User findUsername(String username) {
            User result = null;
    
            try {
                String query = String.format("SELECT * FROM users WHERE username = '%s' LIMIT 1", username);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new User(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public User exists(String column, String value) {
            User result = null;
            
            try {
                String query = String.format("SELECT * FROM users WHERE %s = '%s' LIMIT 1", column, value);

                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new User(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        public User last() {
            User result = null;
            
            try {
                String query = "SELECT * FROM users ORDER BY id DESC LIMIT 1";
                ResultSet resultSet = connect.executeQuery(query);            
    
                if (resultSet.next()) {
                    result = new User(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public User insert() {
            try {
                String query = String.format("insert into users(username,email,password,gender)values('%s','%s','%s','%s')", username, email, password, gender);
    
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return last();
        }

        public User update() {
            try {
                String query = String.format("UPDATE users SET username = '%s', email = '%s', password = '%s', gender = '%s' WHERE id = %d", username, email, password, gender, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public User promote(Integer id) {
            try {
                String query = String.format("UPDATE users SET role = 'admin' WHERE id = %d", id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Boolean delete(Integer id) {
            Integer affected = 0;
            try {
                String query = String.format("DELETE FROM users WHERE id = %d", id);

                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }
    }
    
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
                String query = String.format("UPDATE products SET name = '%s', description = '%s', category = '%s', price = %d, stock = %d WHERE id = %d", name, description, category, price, stock, id);
     
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

    public class Cart {
        private Connect connect;

        private Integer id;
        private Integer user_id;
        private Integer product_id;
        private Integer quantity;
        private String review;
        private String status;


        public Cart() {

            this.connect = Connect.getConnection();
        }

        public Cart(ResultSet resultSet) {

            this.connect = Connect.getConnection();
            
            try {
                this.id = resultSet.getInt("id");
                this.user_id = resultSet.getInt("user_id");
                this.product_id = resultSet.getInt("product_id");
                this.quantity = resultSet.getInt("quantity");
                this.review = resultSet.getString("review");
                this.status = resultSet.getString("status");



            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }

        public void setUserId(Integer user_id) { this.user_id = user_id; }
        public Integer getUserId() { return user_id; }

        public void setProductId(Integer product_id) { this.product_id = product_id; }
        public Integer getProductId() { return product_id; }

        public void setQuantity(Integer quantity) { this.quantity = quantity; }
        public Integer getQuantity() { return quantity; }

        public void setReview(String review) { this.review = review; }
        public String getReview() { return review; }

        public void setStatus(String status) { this.status = status; }
        public String getStatus() { return status; }

        public Vector <Cart> get() {
            Vector <Cart> carts = new Vector <Cart>();
    
            try {
                String query = "SELECT * FROM carts";

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    carts.add(new Cart(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return carts;
        }

        public Cart find(Integer id) {
            Cart result = null;
    
            try {
                String query = String.format("SELECT * FROM carts WHERE id = %d LIMIT 1", id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Cart(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }


        public Cart exists(String column, String value) {
            Cart result = null;
            
            try {
                String query = String.format("SELECT * FROM carts WHERE %s = '%s' LIMIT 1", column, value);

                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Cart(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        public Cart last() {
            Cart result = null;
            
            try {
                String query = "SELECT * FROM carts ORDER BY id DESC LIMIT 1";
                ResultSet resultSet = connect.executeQuery(query);            
    
                if (resultSet.next()) {
                    result = new Cart(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Cart insert() {
            try {
                String query = String.format("insert into carts(user_id,product_id,quantity,review,status)values(%d,%d, %d,'%s','%s')", user_id, product_id, quantity, review, status);
    
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return last();
        }

        public Cart update() {
            try {
                String query = String.format("UPDATE carts SET quantity = %d, review = '%s' WHERE id = %d", quantity, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Boolean delete(Integer id) {
            Integer affected = 0;
            try {
                String query = String.format("DELETE FROM carts WHERE id = %d and status = 'null'", id);

                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }

        public Cart findCart(Integer user_id, Integer product_id) {
            Cart result = null;
    
            try {
                String query = String.format("SELECT * FROM carts WHERE user_id = %d and product_id = %d and status = 'null' LIMIT 1", user_id, product_id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Cart(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Cart updateQuantity() {
            try {
                String query = String.format("UPDATE carts SET quantity = %d WHERE id = %d and status = 'null'", quantity, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Vector <Cart> findCartUser(Integer user_id) {
            Vector <Cart> carts = new Vector <Cart>();
    
            try {
                String query = String.format("SELECT * FROM carts WHERE user_id = %d and status = 'null'", user_id);
                
                ResultSet resultSet = connect.executeQuery(query);

                while (resultSet.next()) {
                    carts.add(new Cart(resultSet));        
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return carts;
        }

        public Cart findCartFinalized(Integer user_id, Integer product_id) {
            Cart result = null;
    
            try {
                String query = String.format("SELECT * FROM carts WHERE user_id = %d and product_id = %d and status = 'Finalized' LIMIT 1", user_id, product_id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Cart(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Vector <Cart> findTransaction(Integer transaction_id) {
            Vector <Cart> carts = new Vector <Cart>();
    
            try {
                String query = String.format("SELECT * FROM carts WHERE transaction_id = %d", transaction_id);
                
                ResultSet resultSet = connect.executeQuery(query);

                while (resultSet.next()) {
                    carts.add(new Cart(resultSet));        
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return carts;
        }

        
        public Boolean deleteUserCart(Integer id) {
            Integer affected = 0;
            try {
                String query = String.format("DELETE FROM carts WHERE user_id = %d and status = 'null'", id);

                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }

         public Cart updateTransaction(Integer user_id, Integer transaction_id) {
            try {
                String query = String.format("UPDATE carts SET transaction_id=%d WHERE user_id = %d and status = 'Pending' and transaction_id=0", transaction_id, user_id);
     
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Cart updateTransactionSuccess(Integer transaction_id) {
            try {
                String query = String.format("UPDATE carts SET status='Finalized' WHERE transaction_id=%d", transaction_id);
     
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }
    }

public class Transaction {
        private Connect connect;

        private Integer id;
        private String date;
        private String status;
        private Integer user_id;


        public Transaction() {

            this.connect = Connect.getConnection();
        }

        public Transaction(ResultSet resultSet) {

            this.connect = Connect.getConnection();
            
            try {
                this.id = resultSet.getInt("id");
                this.date = resultSet.getString("date");
                this.status = resultSet.getString("status");
                this.user_id = resultSet.getInt("user_id");



            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }

        public void setDate(String date) { this.date = date; }
        public String getDate() { return date; }

        public void setStatus(String status) { this.status = status; }
        public String getStatus() { return status; }

        public void setUserId(Integer user_id) { this.user_id = user_id; }
        public Integer getUserId() { return user_id; }

        public Vector <Transaction> get() {
            Vector <Transaction> transactions = new Vector <Transaction>();
    
            try {
                String query = "SELECT * FROM transactions";

                ResultSet resultSet = connect.executeQuery(query);    
                
                while (resultSet.next()) {
                    transactions.add(new Transaction(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return transactions;
        }

        public Transaction find(Integer id) {
            Transaction result = null;
    
            try {
                String query = String.format("SELECT * FROM transactions WHERE id = %d LIMIT 1", id);
                
                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Transaction(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }


        public Transaction exists(String column, String value) {
            Transaction result = null;
            
            try {
                String query = String.format("SELECT * FROM transactions WHERE %s = '%s' LIMIT 1", column, value);

                ResultSet resultSet = connect.executeQuery(query);

                if (resultSet.next()) {
                    result = new Transaction(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        public Transaction last() {
            Transaction result = null;
            
            try {
                String query = "SELECT * FROM transactions ORDER BY id DESC LIMIT 1";
                ResultSet resultSet = connect.executeQuery(query);            
    
                if (resultSet.next()) {
                    result = new Transaction(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        public Transaction insert() {
            try {
                String query = String.format("insert into transactions(status,user_id)values('%s',%d)", status,user_id);
    
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return last();
        }

        public Transaction update() {
            try {
                String query = String.format("UPDATE transactions SET status = '%s' WHERE id = %d", status, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        public Boolean delete(Integer id) {
            Integer affected = 0;
            try {
                String query = String.format("DELETE FROM transactions WHERE id = %d", id);

                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }

        public Transaction updateTransactionSuccess(Integer transaction_id) {
            try {
                String query = String.format("UPDATE transactions SET status='Finalized' WHERE id=%d", transaction_id);
     
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }
    }
%>
