<%-- Ryan/Colin/Jesse --%>
<%@page import="java.sql.*"%>
<%
  int status = 0;
  try{
      String username = request.getParameter("username");
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
      PreparedStatement pst = conn.prepareStatement("INSERT INTO Account VALUES(?,?,?, 'E')");
      
      if(username == "" || email == "" || password == ""){
    	  status = 0;
      }
      else {
        pst.setString(1, username);
        pst.setString(2, email);
        pst.setString(3, password);
        status = pst.executeUpdate();
      }
      if(status > 0){
      response.sendRedirect("index.jsp");
      }
      else{
      response.sendRedirect("registerhome.jsp");
      }
      
      conn.close(); //close connection to db
      
      } catch(Exception e){
          out.print("error");
          }
      
      
      %>
