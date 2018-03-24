<%@page import="java.sql.*"%>
<%
  int status = 0;
  try{
      String username = request.getParameter("username");
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      if(username == "" || email == "" || password == ""){
          status = 0;
      }
      else if(username == "Name..." || email == "Email ID..." || password == "Password..."){
          status = 0;
      }
      else {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
        PreparedStatement pst = conn.prepareStatement("INSERT INTO EndUser VALUES(?,?,?)");
        pst.setString(1, username);
        pst.setString(2, email);
        pst.setString(3, password);
        status = pst.executeUpdate();
      }
      if(status > 0){
      out.print("You are successfully registered");
      }
      else{
      out.print("Invalid registration credentials");
      }
      
      conn.close(); //close connection to db
      
      } catch(Exception e){
          out.print("error");
          }
      
      
      %>
