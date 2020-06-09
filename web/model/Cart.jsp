<%@ include file="../connection/Connect.jsp" %>
<%@page import="java.util.*" %>

<%!
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

        

        public Cart updateQuantity() {
            try {
                String query = String.format("UPDATE carts SET quantity = %d WHERE id = %d and status = 'null'", quantity, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
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

        public Cart updateStatus(Integer id, String status) {
            try {
                String query = String.format("UPDATE carts SET status = '%s' WHERE user_id = %d and status = 'null'", status, id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
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

        public Cart updateReview(String review, Integer user_id, Integer product_id) {
            try {
                String query = String.format("UPDATE carts SET review = '%s' WHERE user_id = %d and status = 'Finalized' and product_id=%d", review, user_id, product_id);
     
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }
    }
%>
