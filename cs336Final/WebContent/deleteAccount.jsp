<%@ page import ="java.sql.*" %>
<%
try{
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement("Delete * from EndUser where email=? and pwd=?"); 
	
}
catch(Exception e){       
   out.println("Error, something went wrong");       
}
response.sendRedirect("index.jsp");
%>