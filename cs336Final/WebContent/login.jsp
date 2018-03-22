<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection();    
        PreparedStatement pst = conn.prepareStatement("Select * from EndUser where email=? and pwd=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Successfully Logged In");        
        else
           out.println("Email and/or password invalid");            
   }
   catch(Exception e){       
       out.println("Error, something went wrong");       
   }      
%>
