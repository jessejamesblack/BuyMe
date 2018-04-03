<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
        PreparedStatement pst = conn.prepareStatement("Select * from Account where username=? and pwd=? and accountType = 'E'");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();   
        
        if(rs.next()) {
        	session.setAttribute("USERNAME", rs.getString("username"));
        	session.setAttribute("EMAIL", rs.getString("email"));
        	session.setAttribute("ACCOUNTTYPE", rs.getString("accountType"));
           response.sendRedirect("auctionhome.jsp");
        }else{
           response.sendRedirect("index.jsp");
           }
        conn.close();
   }
   catch(Exception e){       
       out.println("Error, something went wrong");       
   }      
   
%>
