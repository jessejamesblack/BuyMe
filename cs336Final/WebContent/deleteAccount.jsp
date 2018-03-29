<%@ page import ="java.sql.*" %>
<%
try{
	String username = request.getParameter("username");
    /*String email = request.getParameter("email");   
    String password = request.getParameter("password");*/
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement("Delete * from EndUser"); 
    pst.setString(1, username);
    /*pst.setString(1, email);
    pst.setString(2, password);*/
    pst.executeUpdate();	
}
catch(Exception e){       
   out.println("Error, something went wrong");       
}
response.sendRedirect("index.jsp");
%>