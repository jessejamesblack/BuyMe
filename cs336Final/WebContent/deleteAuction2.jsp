<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>

<%

String[] checkboxValues = request.getParameterValues("item");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");


Statement stmt = null;
stmt = conn.createStatement();


for(int i = 0; i < checkboxValues.length;i++){
	String query = "DELETE FROM Auction WHERE auction_number ='"+checkboxValues[i]+"'";
	stmt.executeUpdate(query);
	String query2 = "DELETE FROM Bid WHERE auction_number ='"+checkboxValues[i]+"'";
	stmt.executeUpdate(query2);
	
	
}


conn.close();
response.sendRedirect("deleteAuction.jsp");
%>