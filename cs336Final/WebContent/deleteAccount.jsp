<%-- Colin --%>
<%@ page import ="java.sql.*" %>
<%
int status = 0;
try{
    String username = request.getParameter("username");
    String email = request.getParameter("email");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Account WHERE username = ? AND email = ? AND pwd = ? AND accountType='E'"); 
    pst.setString(1, username);
    pst.setString(2, email);
    pst.setString(3, password);
    ResultSet rs = pst.executeQuery();
    if(rs.next()){
    	PreparedStatement pst2 = conn.prepareStatement("DELETE FROM Account WHERE username = ?");
	pst2.setString(1, username);
	status = pst2.executeUpdate();
	if(status>0){
		out.print("success in deletion");
	}else {
		out.print("failed deletion");
	}
    }else {out.print("can't do that, account info illegal");}
}
catch(Exception e){       
   out.print(e.getMessage());       
}
response.sendRedirect("index.jsp");
%>
