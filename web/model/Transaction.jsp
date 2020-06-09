<%@ include file="../connection/Connect.jsp" %>
<%@page import="java.util.*" %>

<%!
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
