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
%>
